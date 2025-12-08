#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/AxionAOSP/android.git -b lineage-23.0 --git-lfs
/opt/crave/resync.sh || repo sync

