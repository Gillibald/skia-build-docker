#!/bin/bash

mkdir -p skiabuild
cd skiabuild
git clone https://github.com/mono/skia.git -b v1.68.2.1
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

cd skia
python tools/git-sync-deps
