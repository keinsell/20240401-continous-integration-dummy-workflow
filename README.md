# ci-nodejs
🤖 Highly Optimized CI/CD Pipeline dedicated to Node.js Applications (with Docker and Nix)

## Features

- [ ] Release-based deployments with tracking of version
- [ ] Multiple environmnets (development,next,production)
- [ ] Linting, Formatting and other code-quality things
- [ ] Builds with any toolchain related to language based on turbo
- [ ] Releasing only changed things
- [ ] Docker builds with solid caching
- [ ] Secret management through terraform

## Services

### SonarCloud / SonarQube

The Repository is using [SonarCloud]() to analyze source code and build metrics based on the whole repository.
It's free for open-source repositories (in meaning you can use cloud-hosted version) and for the private repositories
there is a requirement for self-hosting or paying for cloud version.

## Build

```bash
# Build with turbo and Node.js
pnpm build
# Build with Docker Buildx Bake
docker buildx bake dummyapplication
```

## Inspiration

- https://github.com/william-liebenberg/github-gated-deployments/tree/main
