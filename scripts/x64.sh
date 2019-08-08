#!/bin/bash
cd /work/skia
set -x
set -e
./bin/gn gen 'out/linux/x64' --args='
    is_official_build=true skia_enable_tools=false
    target_os="linux" target_cpu="x64"
    skia_use_icu=false skia_use_sfntly=false skia_use_piex=true
    skia_use_system_expat=false skia_use_system_freetype2=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false
    skia_enable_gpu=true
    extra_cflags=[ "-DSKIA_C_DLL" ]
    extra_ldflags=[ "-static-libstdc++", "-static-libgcc", "-Wl,--version-script=/scripts/version.script" ]
    linux_soname_version="68.0.0"'


../depot_tools/ninja 'SkiaSharp' -C 'out/linux/x64'
chmod -R 777 out
