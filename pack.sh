#!/bin/sh
set -x
set -e

mkdir -p nuget/libs/arm64

cp skiabuild/skia/out/linux/arm64/libSkiaSharp.so.68.2.1 nuget/libs/arm64/libSkiaSharp.so

mkdir -p nuget/libs/armhf

cp skiabuild/skia/out/linux/armhf/libSkiaSharp.so.68.2.1 nuget/libs/armhf/libSkiaSharp.so

cd nuget

dotnet pack -c Release
