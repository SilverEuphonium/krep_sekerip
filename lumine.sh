#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/LumineDroid/platform_manifest -b bellflower --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Lumine-16.2 device/xiaomi/earth

# Compat
rm -rf hardware/lineage/compat
git clone https://github.com/Kitauji-High-School/android_hardware_lineage_compat.git -b lineage-23.2 hardware/lineage/compat

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch earth-bp4a-userdebug
mka bacon
