#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/ProjectMatrixx/android.git -b 16.0 --git-lfs
/opt/crave/resync.sh || repo sync

rm -rf device/xiaomi/earth kernel/xiaomi/earth
git clone https://github.com/SilverEuphonium/android_device_xiaomi_earth.git -b Matrixx-16 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-23.0 vendor/xiaomi/earth
git clone https://github.com/SilverEuphonium/android_kernel_xiaomi_earth.git -b 16 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.0 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b matrixx vendor/lineage-priv/keys

rm -rf packages/apps/Jelly
export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=pangokceria
export TZ="Asia/Jakarta"

. build/envsetup.sh
lunch lineage_earth-bp2a-userdebug
mka bacon
