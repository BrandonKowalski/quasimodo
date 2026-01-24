FROM golang:1.24-bullseye

LABEL org.opencontainers.image.source="https://github.com/BrandonKowalski/quasimodo"
LABEL org.opencontainers.image.description="Base image for gabagool-backed applications with Go, SDL2, and build tools"

RUN apt-get update && apt-get install -y \
    gcc \
    libsdl2-dev \
    libsdl2-ttf-dev \
    libsdl2-image-dev \
    libsdl2-gfx-dev \
    jq \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
