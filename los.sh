#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/SilverEuphonium/manifest.git -b 16-qpr2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/SilverEuphonium/android_device_xiaomi_earth.git -b Mica-16.2 device/xiaomi/earth
git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-23.1 vendor/xiaomi/earth
git clone https://github.com/SilverEuphonium/android_kernel_xiaomi_earth.git -b 16 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.1 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.1 hardware/mediatek
git clone https://github.com/SilverEuphonium/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b main vendor/lineage-priv/keys
git clone https://github.com/techyminati/android_vendor_mediatek_ims.git vendor/mediatek/ims

export BUILD_USERNAME=ririsaa
export BUILD_HOSTNAME=oumae

. build/envsetup.sh
lunch mica_earth-bp4a-userdebug
mka bacon 
