#!/bin/sh
set -x
set -e
mkdir -p nuget/libs/armhf
mkdir -p nuget/libs/x64

cp skiabuild/skia/out/linux/armhf/libSkiaSharp.so.68.0.0 nuget/libs/armhf/libSkiaSharp.so
cp skiabuild/skia/out/linux/x64/libSkiaSharp.so.68.0.0 nuget/libs/x64/libSkiaSharp.so
cd nuget
dotnet pack -c Release
