#!/bin/bash
set -e
set -x
cd /work/skia

./bin/gn gen 'out/linux/arm64' --args='
    cc="clang-9"
    cxx="clang++-9"
    is_official_build=true skia_enable_tools=false
    target_os="linux" target_cpu="arm64"
    skia_use_icu=false skia_use_sfntly=false skia_use_piex=true
    skia_use_system_expat=false skia_use_system_freetype2=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false
    skia_enable_gpu=true
    extra_cflags=[ "-DSKIA_C_DLL" ]
    extra_ldflags=[ "-static-libstdc++", "-static-libgcc", "-Wl,--version-script=/scripts/version.script", "-L/usr/bin/aarch64-linux-gnu-cpp" ]
    linux_soname_version="68.2.1"'


../depot_tools/ninja 'SkiaSharp' -C 'out/linux/arm64'
chmod -R 777 out

