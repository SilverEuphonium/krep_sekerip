#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf device/xiaomi/earth kernel/xiaomi/earth vendor/xiaomi/earth
rm -rf hardware/xiaomi hardware/mediatek device/mediatek/sepolicy_vndr vendor/os-priv/keys

repo init -u https://github.com/Evolution-X/manifest -b udc --git-lfs 
/opt/crave/resync.sh || repo sync

git clone https://github.com/SilverEuphonium/android_device_xiaomi_earth.git -b EvolutionX-14 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_bumi.git -b 4.19.306 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-21 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-21 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b evok vendor/evolution-priv/keys

# Export
export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=pangokceria
export ALLOW_MISSING_DEPENDENCIES=true

# starts build setup !
. build/envsetup.sh
lunch lineage_earth-userdebug
m evolution 
