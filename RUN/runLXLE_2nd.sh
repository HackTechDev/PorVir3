#!/bin/bash

echo "2nd launch"


echo "*************************************************"
echo "Initialize Host Machine"

export H_DESKTOP=LUBUNTU
export H_DISTRIB=LUBUNTU
export H_VERSION=18.04
export H_PROC=64


echo "*************************************************"
echo "Initialize Guest Hardware"

export RAM=2048
export CORE=2


echo "*************************************************"
echo "Configure Virtual Machine"

export QEVER=6.0.0
export G_DISTRIB=LXLE
export G_VERSION=18.04
export G_PROC=64
export TAP=0
export APP=DEV2
export VDA=vda


echo "*************************************************"
echo "Launch Virtual Machine"

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:../HOST/$H_DISTRIB/$H_VERSION/$H_PROC/QEMU/$QEVER/lib/ \
    ../HOST/$H_DISTRIB/$H_VERSION/$H_PROC/QEMU/$QEVER/qemu-$QEVER/build/qemu-system-x86_64 \
    -drive file=../../pvvd/GUEST/$G_DISTRIB/$G_VERSION/$G_PROC/$APP/VD/$VDA.qcow2,format=qcow2,index=0,media=disk \
    -enable-kvm  -m $RAM -sdl -vga std \
    -device intel-hda -device hda-duplex -device AC97 \
    -net nic,macaddr=$MACADDRESS -net tap,ifname=tap$TAP,script=no \
    -smp $CORE \
    -rtc base=localtime -no-quit \
    -bios ../HOST/$H_DISTRIB/$H_VERSION/$H_PROC/QEMU/$QEVER/pc-bios/bios-256k.bin
