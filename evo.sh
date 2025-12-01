#!/bin/bash
# ok
rm -rf prebuilts/clang/host/linux-x86

# repo init
repo init -u https://github.com/Evolution-X/manifest -b bq1 --git-lfs 

# Sync repository
/opt/crave/resync.sh || repo sync

# remove
rm -rf device/xiaomi/earth kernel/xiaomi/earth vendor/xiaomi/earth
# cloning trees
git clone https://github.com/SilverEuphonium/android_device_xiaomi_earth.git -b EvolutionX-16.1 device/xiaomi/earth
git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-23.1 vendor/xiaomi/earth
git clone https://github.com/SilverEuphonium/android_kernel_xiaomi_earth.git -b 16 kernel/xiaomi/earth

# Other dependencies
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.0 hardware/mediatek
git clone https://github.com/AbuRider/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b evox vendor/evolution-priv/keys
git clone https://github.com/techyminati/android_vendor_mediatek_ims.git vendor/mediatek/ims

# Export
export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=pangokceria
export TZ="Asia/Jakarta"
export ALLOW_MISSING_DEPENDENCIES=true

# starts build setup !
. build/envsetup.sh
lunch lineage_earth-bp3a-userdebug
m evolution 
