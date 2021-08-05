# Multi-architecture k9s

![dev](https://github.com/fpiesche/docker-k9s/actions/workflows/build-dev.yaml/badge.svg)
![release](https://github.com/fpiesche/docker-k9s/actions/workflows/build-tags.yaml/badge.svg)

The purpose of this repository is to generate multi-architecture images of [derailed/k9s](https://github.com/derailed/k9s), because the official images for k9s are only available for `amd64`.

# Quick reference

-   **Image Repositories**:
    - Docker Hub: [`florianpiesche/k9s`](https://hub.docker.com/r/florianpiesche/k9s)  
    - GitHub Packages: [`ghcr.io/fpiesche/k9s`](https://ghcr.io/fpiesche/k9s)  

-   **Maintained by**:  
	[Florian Piesche](https://github.com/fpiesche) (Docker images)
    [derailed](https://github.com/derailed) (k9s application)

-	**Where to file issues**:  
    [https://github.com/fpiesche/docker-k9s/issues](https://github.com/fpiesche/docker-k9s/issues) (Docker images)
    [https://github.com/derailed/k9s/issues](https://github.com/derailed/k9s/issues) (k9s application)

-   **Dockerfile**:
    [https://github.com/fpiesche/docker-k9s/blob/main/Dockerfile](https://github.com/fpiesche/docker-k9s/blob/main/Dockerfile)

-   **Base image**:  
    [alpine:edge](https://hub.docker.com/_/alpine)  
    The `edge` tag was chosen as there are multi-platform versions of `kubectl` available in Alpine's `edge/testing`, making for the easiest available source for ARM builds of `kubectl`.

-	**Supported architectures**:
    Each image is a multi-arch manifest for the following architectures:
    `amd64`, `arm64`, `armv7`, `armv6`

-	**Source of this description**: [Github README](https://github.com/fpiesche/docker-k9s/tree/main/README.md) ([history](https://github.com/fpiesche/docker-k9s/commits/main/README.md))

# Supported tags

-   `latest` is based on the most recent [tagged k9s release](https://github.com/derailed/k9s/releases). Images are also tagged with the release name to allow running specific versions.
-   `dev` is built from the most recent commits on [k9s's `master` branch](https://github.com/derailed/k9s/tree/master). Images are also tagged with the short commit ID they were built from.

# How to use this image

There's no need for data persistence to use k9s, and no web service to access. You will need to run the image in interactve mode and mount the `kubeconfig` file for the cluster you want to inspect to `/root/.kube/config` in the container using the `-v` parameter. For example:

```console
$ docker run \
  --rm -it \
  -v ~/.kube/config:/root/.kube/config \
  florianpiesche/k9s
```
