#!/bin/bash

repo init -u https://github.com/SilverEuphonium/android_manifest.git -b 16.0 --git-lfs --no-clone-bundle
/opt/crave/resync.sh || repo sync

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b crDroid-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
make installclean
mka bacon
