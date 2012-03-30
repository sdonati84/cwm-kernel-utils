#!/bin/sh
export ANDROID_BUILD_TOP=/home/steve/android/system
KERNEL_DIR=/home/steve/android/system/kernel/samsung/aries
PRODUCT=galaxysmtd
DEVICE_DIR=/home/steve/android/system/device/samsung/$PRODUCT
CWM_SCRIPTS_DIR="/home/steve/android/cwm-kernel-utils"

cd $KERNEL_DIR
./build.sh $PRODUCT

cd $CWM_SCRIPTS_DIR
cp $ANDROID_BUILD_TOP/out/target/product/$PRODUCT/ramdisk.img .
cp $ANDROID_BUILD_TOP/out/target/product/$PRODUCT/ramdisk-recovery.img .
cp $DEVICE_DIR/kernel zImage
cp $DEVICE_DIR/*.ko cwm/system/lib/modules
./mkshbootimg.py boot.img zImage ramdisk.img ramdisk-recovery.img

rm zImage
rm ramdisk.img
rm ramdisk-recovery.img

mv boot.img cwm/
cd cwm
zip -r kernel.zip *
mv kernel.zip ../
rm boot.img
