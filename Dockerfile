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
ARG CLI11_VERSION=1.9.1
ARG CLI11_URL=https://github.com/CLIUtils/CLI11/releases/download/v${CLI11_VERSION}/CLI11.hpp
ADD $CLI11_URL /usr/include/

# Build boost from source
#RUN mkdir /boost-Build \
#    && curl -L https://sourceforge.net/projects/boost/files/boost/1.64.0/boost_1_64_0.tar.gz | \
#    tar xz --strip-components=1 -C /boost-Build \
#    && cd /boost-Build \
#    && ./bootstrap.sh --with-libraries=program_options \
#    && ./b2 link=static cxxflags="-fPIC -static -Wl,--whole-archive" threading=multi install \
#    && rm -fR /boost-Build

# Install required boost include files
ARG BOOST_URL=http://www.sdml.cs.kent.edu/build/srcML-1.0.0-Boost.tar.gz
RUN curl -L $BOOST_URL | tar xz -C /usr/local/include
