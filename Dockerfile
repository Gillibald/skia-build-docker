FROM ubuntu:16.04 as toolchain
RUN apt-get update && apt-get install --no-install-recommends -y python2.7 python build-essential  && rm -rf /var/lib/apt/lists/*


FROM toolchain as x64
RUN apt-get update && apt-get install -y libfontconfig-dev && rm -rf /var/lib/apt/lists/*

FROM toolchain as armhf
RUN dpkg --add-architecture armhf
ADD ./arm-sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y  g++-4.9-arm-linux-gnueabihf gcc-4.9-arm-linux-gnueabihf binutils-arm-linux-gnueabihf  libfontconfig-dev:armhf && rm -rf /var/lib/apt/lists/*
