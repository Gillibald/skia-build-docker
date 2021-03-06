#!/bin/bash
set -e
set -x
cd /work/skia

./bin/gn gen 'out/linux/armhf' --args='
    cc="clang"
    cxx="clang++"
    is_official_build=true skia_enable_tools=false
    target_os="linux" target_cpu="arm"
    skia_use_icu=false skia_use_sfntly=false skia_use_piex=true
    skia_use_system_expat=false skia_use_system_freetype2=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false
    skia_enable_gpu=true
    extra_cflags=[ "-DSKIA_C_DLL", "-mfpu=neon", "-mfloat-abi=hard" ]
    extra_ldflags=[ "-static-libstdc++", "-static-libgcc", "-Wl,--version-script=/scripts/version.script", "-L/usr/lib/arm-linux-gnueabihf", "-mfloat-abi=hard" ]
    linux_soname_version="68.2.1"'


../depot_tools/ninja 'SkiaSharp' -C 'out/linux/armhf'
chmod -R 777 out

