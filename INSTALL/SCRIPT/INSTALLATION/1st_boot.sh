#!/bin/sh

qemu-system-x86_64 -enable-kvm -m 2048 -sdl  -vga std -hda vda.qcow2 -cdrom ../../../../nekrovd/HOST/LUBUNTU/1804/64/ISO/lubuntu-18.04-desktop-amd64.iso -boot d -net nic,model=rtl8139 -net user -smp 2 -localtime
