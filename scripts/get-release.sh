#!/bin/bash

#curl -s https://api.github.com/repos/ggfan/android-ndk-bin/releases/latest \
#| grep "browser_download_url.*tar" \
#| cut -d : -f 2,3 \
#| tr -d \" \
#| wget -qi -

mkdir -p ndk
pushd ndk >/dev/null

echo downloading ndk...
curl -s https://api.github.com/repos/ggfan/android-ndk-bin/releases/latest \
  | grep "browser_download_url.*tar" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget -qi -

tar -xf *.tar
rm -fr *.tar
echo ndk extracted ok

ANDROID_NDK_HOME="$(pwd)/$(find . -maxdepth 1 -type d -name '*android*' -print -quit)"
export ANDROID_NDK_HOME="$(realpath ${ANDROID_NDK_HOME})"
echo   INFO: ANDROID_NDK_HOME=${ANDROID_NDK_HOME}
popd >/dev/null

