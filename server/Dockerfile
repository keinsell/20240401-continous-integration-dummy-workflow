# syntax=docker/dockerfile:1

ARG NODE_VERSION=20.10.0
ARG APPLICATION_NAME=server

# Install Docker Buildx
FROM docker
COPY --from=docker/buildx-bin /buildx /usr/libexec/docker/cli-plugins/docker-buildx
RUN docker buildx version

# Setup Base Node.js Image
FROM node:${NODE_VERSION} AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base AS builder
ARG APPLICATION_NAME
#RUN apk update
#RUN apk add --no-cache libc6-compat

WORKDIR /app

RUN RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm add turbo@latest -g

COPY . .

RUN RUN --mount=type=cache,id=pnpm,target=/pnpm/store turbo prune ${APPLICATION_NAME} --docker

FROM base AS installer
ARG APPLICATION_NAME


#RUN apk update
#RUN apk add --no-cache libc6-compat
WORKDIR /app

COPY .gitignore .gitignore
COPY --from=builder /app/out/json/ .
COPY --from=builder /app/out/pnpm-lock.yaml ./pnpm-lock.lock

RUN  RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile --prefer-offline

COPY --from=builder /app/out/full/ .

RUN pnpm turbo run build --filter=${APPLICATION_NAME}...

FROM base AS runner
ARG APPLICATION_NAME
WORKDIR /app

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs
USER nextjs

ENTRYPOINT "echo 'Hello World'"