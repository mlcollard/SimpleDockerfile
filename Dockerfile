# Linux C++ build environment
FROM ubuntu:20.10
LABEL org.srcml.distro="ubuntu" \
      org.srcml.email="collard@uakron.edu"

# Installed packages for C++ build
RUN apt-get update && apt-get install -y \
    # compiler
    g++ \
    # version control
    git \
    # build
    make \
    ninja-build \
    # utilities
    curl \
    # remove unneeded apt updates
    && rm -rf /var/lib/apt/lists/*

# Install CLI11.hpp from local version
#ADD CLI11.hpp /usr/include/

# Install CLI11.hpp from URL
ADD https://github.com/CLIUtils/CLI11/releases/download/v1.9.1/CLI11.hpp /usr/include/

# Build boost from scratch
RUN mkdir /boost-Build \
    && curl -L https://sourceforge.net/projects/boost/files/boost/1.64.0/boost_1_64_0.tar.gz | \
    tar xz --strip-components=1 -C /boost-Build \
    && cd /boost-Build \
    && ./bootstrap.sh --with-libraries=program_options,filesystem,thread,date_time \
    && ./b2 link=static cxxflags="-fPIC -static -Wl, --whole-archive" threading=multi install \
    && cd \
    && rm -fR /boost-Build

