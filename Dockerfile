FROM ubuntu:20.10

RUN apt-get update && apt-get install -y \
    make \
    g++ \
    git \
    ninja-build \
    && rm -rf /var/lib/apt/lists/*

