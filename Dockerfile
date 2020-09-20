# Linux C++ build environment
FROM ubuntu:20.10
LABEL org.srcml.distro="ubuntu"

# Installed packages for C++ build
RUN apt-get update && apt-get install -y \
    # compiler
    g++ \
    # version control
    git \
    # build
    make \
    ninja-build \
    # remove unneeded apt updates
    && rm -rf /var/lib/apt/lists/*

