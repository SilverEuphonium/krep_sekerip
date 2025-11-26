#!/bin/bash
# ok
rm -rf prebuilts/clang/host/linux-x86

# repo init
repo init -u https://github.com/The-Clover-Project/manifest.git -b 16-qpr1 --git-lfs 

# Sync repository
/opt/crave/resync.sh || repo sync

# cloning trees
git clone https://github.com/SilverEpuhonium/android_device_xiaomi_earth.git -b Clover-16.1 device/xiaomi/earth
git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-23.1 vendor/xiaomi/earth
git clone https://github.com/SilverEuphonium/android_kernel_xiaomi_earth.git -b 16 kernel/xiaomi/earth

# Mediatek and Hw repos
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.0 hardware/mediatek
git clone https://github.com/SilverEuphonium/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr

# Pelengkap
git clone https://github.com/SilverEuphonium/priv_keys.git -b clover vendor/clover-priv/keys
git clone https://github.com/techyminati/android_vendor_mediatek_ims.git vendor/mediatek/ims

# Export
export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=pangokceria
export TZ="Asia/Jakarta"
export ALLOW_MISSING_DEPENDENCIES=true

# starts build setup !
. build/envsetup.sh
lunch clover_earth-bp3a-userdebug
mka bacon
