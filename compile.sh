RUN="sudo docker run -it -v `pwd`/scripts:/scripts -v `pwd`/skiabuild:/work -w /work/skia"

set -x
set -e
$RUN skia-toolchain-x64 /scripts/x64.sh
$RUN skia-toolchain-armhf /scripts/armhf.sh

