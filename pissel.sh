#!/bin/bash

repo init -u https://github.com/Kitauji-High-School/pixelos_manifest.git -b test --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b PixelOS-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
breakfast earth userdebug
make installclean
m pixelos
