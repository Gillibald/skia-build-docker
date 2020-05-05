FROM ubuntu:16.04 as toolchain
RUN apt-get update && apt-get install --no-install-recommends -y python2.7 python build-essential clang-9  && rm -rf /var/lib/apt/lists/*


FROM toolchain as arm64
RUN dpkg --add-architecture arm64
ADD ./arm-sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y  g++-4.9-aarch64-linux-gnu gcc-4.9-aarch64-linux-gnu binutils-aarch64-linux-gnu  libfontconfig-dev:arm64 && rm -rf /var/lib/apt/lists/*


FROM toolchain as armhf
RUN dpkg --add-architecture armhf
ADD ./arm-sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y  g++-4.9-arm-linux-gnueabihf gcc-4.9-arm-linux-gnueabihf binutils-arm-linux-gnueabihf  libfontconfig-dev:armhf && rm -rf /var/lib/apt/lists/*
