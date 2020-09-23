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

# Build boost from source
#RUN mkdir /boost-Build \
#    && curl -L https://sourceforge.net/projects/boost/files/boost/1.64.0/boost_1_64_0.tar.gz | \
#    tar xz --strip-components=1 -C /boost-Build \
#    && cd /boost-Build \
#    && ./bootstrap.sh --with-libraries=program_options \
#    && ./b2 link=static cxxflags="-fPIC -static -Wl,--whole-archive" threading=multi install \
#    && rm -fR /boost-Build

# Install required boost include files
RUN curl -L http://www.sdml.cs.kent.edu/build/srcML-1.0.0-Boost.tar.gz | \
    tar xz -C /usr/local/include
