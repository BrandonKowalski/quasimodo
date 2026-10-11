FROM debian:bullseye

ARG GO_VERSION=1.26.9

LABEL org.opencontainers.image.source="https://github.com/BrandonKowalski/quasimodo"
LABEL org.opencontainers.image.description="Base image for gabagool-backed applications with Go, SDL2, and build tools"

RUN sed -i 's|http://deb.debian.org|http://archive.debian.org|g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
    gcc \
    libsdl2-dev \
    libsdl2-ttf-dev \
    libsdl2-image-dev \
    libsdl2-gfx-dev \
    jq \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN ARCH=$(dpkg --print-architecture) && \
    case "$ARCH" in armhf) ARCH=armv6l ;; i386) ARCH=386 ;; esac && \
    curl -fsSL https://go.dev/dl/go${GO_VERSION}.linux-${ARCH}.tar.gz \
    | tar -C /usr/local -xz

ENV PATH="/usr/local/go/bin:${PATH}"

WORKDIR /build
