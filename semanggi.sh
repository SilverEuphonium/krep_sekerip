#!/bin/bash
# rm -rf prebuilts/clang/host/linux-x86

# repo init -u https://github.com/The-Clover-Project/manifest.git -b 16-qpr2 --git-lfs 
# /opt/crave/resync.sh || repo sync

rm -rf device/xiaomi/earth
git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth -b Clover-16.2 device/xiaomi/earth

git clone https://github.com/LineageOS/android_packages_apps_EuiccPolicy.git -b lineage-23.2 packages/apps/EuiccPolicy

# Export
export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

# starts build setup !
. build/envsetup.sh
lunch clover_earth-bp4a-userdebug
mka clover
