#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/SilverEuphonium/android_manifest.git -b 16.0 --git-lfs --no-clone-bundle
/opt/crave/resync.sh || repo sync

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b crDroid-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
brunch earth userdebug
