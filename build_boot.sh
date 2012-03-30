#!/bin/sh
export ANDROID_BUILD_TOP=/home/steve/android/system
export DEVICE_DIR=/home/steve/android/system/device/samsung/galaxysmtd

cp $ANDROID_BUILD_TOP/out/target/product/galaxysmtd/ramdisk.img .
cp $ANDROID_BUILD_TOP/out/target/product/galaxysmtd/ramdisk-recovery.img .
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
