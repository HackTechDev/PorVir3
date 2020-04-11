#!/bin/bash


case "$1" in
    1) echo "Dev"
        LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:../HOST/$H_DISTRIB/$H_VERSION/$H_PROC/QEMU/$QEVER/lib/ \
	        ../HOST/$H_DISTRIB/$H_VERSION/$H_PROC/QEMU/$QEVER/qemu-$QEVER/x86_64-softmmu/qemu-system-x86_64 \
	        -drive file=../../pvvd/GUEST/$G_DISTRIB/$G_VERSION/$G_PROC/$APP/VD/$VDA.qcow2,format=qcow2,index=0,media=disk \
	        -enable-kvm  -m $RAM -sdl -vga std \
	        -soundhw hda,ac97 \
	        -net nic,macaddr=$MACADDRESS -net tap,ifname=tap$TAP,script=no \
	        -smp $CORE \
	        -rtc base=localtime -no-quit \
	        -bios ../HOST/$H_DISTRIB/$H_VERSION/$H_PROC/QEMU/$QEVER/pc-bios/bios-256k.bin \
	        -usb  -device usb-ehci,id=ehci -device usb-host,bus=ehci.0,vendorid=0x$VENDORID,productid=0x$PRODUCTID &
    ;;

	2) echo "Prod"

        LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:../HOST/$H_DISTRIB/$H_VERSION/$H_PROC/QEMU/$QEVER/lib/ \
	        ../HOST/$H_DISTRIB/$H_VERSION/$H_PROC/QEMU/$QEVER/qemu-$QEVER/x86_64-softmmu/qemu-system-x86_64 \
	        -drive file=../../pvvd/GUEST/$G_DISTRIB/$G_VERSION/$G_PROC/$APP/VD/$VDA.qcow2,format=qcow2,index=0,media=disk \
	        -enable-kvm  -m $RAM -sdl -vga std \
	        -soundhw hda,ac97 \
	        -net nic,macaddr=$MACADDRESS -net tap,ifname=tap$TAP,script=no \
	        -smp $CORE \
	        -rtc base=localtime -no-quit \
	        -bios ../HOST/$H_DISTRIB/$H_VERSION/$H_PROC/QEMU/$QEVER/pc-bios/bios-256k.bin &
    ;;

    *) echo "Choose prod or dev"
    ;;
esac
    
