FROM ubuntu:20.10

RUN apt-get update
RUN apt-get install make
RUN apt-get install -y g++
RUN apt-get install -y git
RUN apt-get install ninja-build
RUN rm -rf /var/lib/apt/lists/*

