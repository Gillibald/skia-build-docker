#!/bin/sh
set -x
set -e
sudo docker build  --target=x64 -t skia-toolchain-x64 .
sudo docker build  --target=armhf -t skia-toolchain-armhf .
