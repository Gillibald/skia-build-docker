#!/bin/sh
set -x
set -e
sudo docker build  --target=arm64 -t skia-toolchain-arm64 .
sudo docker build  --target=armhf -t skia-toolchain-armhf .
