#!/bin/bash
rm -rf device/xiaomi/earth vendor/xiaomi/earth kernel/xiaomi/earth vendor/mediatek/ims
rm -rf hardware/mediatek hardware/xiaomi device/mediatek/sepolicy_vndr

git clone https://github.com/SilverEuphonium/android_device_xiaomi_earth.git -b PixelOS-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
breakfast earth userdebug
make installclean
m pixelos
