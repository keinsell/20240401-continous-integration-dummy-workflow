group "default" {
  targets = ["dummyapplication"]
}

target "dummyapplication" {
  args = {
    "NODE_VERSION" = "22.0.0"
  }
  context = "."
  dockerfile = "server/Dockerfile"
  tags = ["dummyapplication:latest"]
  platforms = ["linux/amd64"]
}