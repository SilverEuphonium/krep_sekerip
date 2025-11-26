#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/LumineDroid/platform_manifest.git -b bynx --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/SilverEuphonium/android_device_xiaomi_earth.git -b Lumine-16 device/xiaomi/earth

. build/envsetup.sh
lunch lineage_earth-bp2a-userdebug
mka bacon
