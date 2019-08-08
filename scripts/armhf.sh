#!/bin/bash
set -e
set -x
cd /work/skia

./bin/gn gen 'out/linux/armhf' --args='
    cc="arm-linux-gnueabihf-gcc-4.9"
    cxx="arm-linux-gnueabihf-g++-4.9"
    is_official_build=true skia_enable_tools=false
    target_os="linux" target_cpu="arm"
    skia_use_icu=false skia_use_sfntly=false skia_use_piex=true
    skia_use_system_expat=false skia_use_system_freetype2=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false
    skia_enable_gpu=true
    extra_cflags=[ "-DSKIA_C_DLL", "-mfpu=neon", "-mfloat-abi=hard" ]
    extra_ldflags=[ "-static-libstdc++", "-static-libgcc", "-Wl,--version-script=/scripts/version.script", "-L/usr/lib/arm-linux-gnueabihf", "-mfloat-abi=hard" ]
    linux_soname_version="68.0.0"'


../depot_tools/ninja 'SkiaSharp' -C 'out/linux/armhf'
chmod -R 777 out

