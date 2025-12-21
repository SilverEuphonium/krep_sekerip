#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/PixelOS-AOSP/android_manifest.git -b sixteen-qpr1 --git-lfs 
/opt/crave/resync.sh || repo sync

git clone https://github.com/SilverEuphonium/android_device_xiaomi_earth.git -b PixelOS-16.1 device/xiaomi/earth
git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-23.1 vendor/xiaomi/earth
git clone https://github.com/SilverEuphonium/android_kernel_xiaomi_earth.git -b 16 kernel/xiaomi/earth

git clone https://github.com/SilverEuphonium/android_hardware_xiaomi.git -b lineage-23.1 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.0 hardware/mediatek
git clone https://github.com/SilverEuphonium/android_device_mediatek_sepolicy_vndr -b lineage-23.0 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b main vendor/lineage-priv/keys
git clone https://github.com/techyminati/android_vendor_mediatek_ims.git vendor/mediatek/ims

# Export
export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=crave

# starts build setup !
. build/envsetup.sh
breakfast earth userdebug
m pixelos
