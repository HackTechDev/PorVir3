#!/bin/bash

# Qemu 2.11.1 / 3.0.0 / 4.2.0
# Ubuntu / Lubuntu / FreeBSD / GhostBSD
# 32 / 64
# Monouser / Multiuser

QEVER=
G_DISTRIB=
G_VERSION=
G_PROC=
APP=
VDA=

case "$1" in
	1) echo "- Qemu -"
    echo "2.11.1"
	QEVER=2.11.1
	;;

	2) echo "- Qemu -"
    echo "3.0.0"
	QEVER=3.0.0
	;;

	3) echo "- Qemu -"
    echo "4.2.0"
	QEVER=4.2.0
	;;

	4) echo "- Qemu -"
    echo "2.5.0"
	QEVER=2.5.0
	;;

	5) echo "- Qemu -"
    echo "5.0.0"
	QEVER=5.0.0
	;;


    l) echo "Virtual Machine list:"
        echo "Qemu_2.11.1-FreeBSD_12.1_64-MultiUser-Minetest"
        echo "Qemu_2.11.1-Lubuntu_18.04_64-MultiUser-Crossfire"
        echo "Qemu_2.11.1-Lubuntu_18.04_64-MultiUser-Docker"
        echo "Qemu_2.11.1-Lubuntu_18.04_64-MultiUser-Doom"
        echo "Qemu_2.11.1-Lubuntu_18.04_64-MultiUser-Hexen"
        echo "Qemu_2.11.1-Lubuntu_18.04_64-MultiUser-Minetest"
        echo "Qemu_2.11.1-Lubuntu_18.04_64-MultiUser-Network"
        echo "Qemu_2.11.1-Lubuntu_18.04_64-MultiUser-Office"
        echo "Qemu_2.11.1-Lubuntu_18.04_64-MultiUser-Quake"
        echo "Qemu_2.11.1-Lubuntu_18.04_64-MultiUser-RPG"
        echo "Qemu_2.11.1-Lubuntu_18.04_64-MultiUser-UfoAI"
        echo "Qemu_3.0.0-Lubuntu_18.04_64-MonoUser-Doom"
        echo "Qemu_3.0.0-Lubuntu_18.04_64-MonoUser-Hexen"
        echo "Qemu_3.0.0-Lubuntu_18.04_64-MonoUser-NetPlan"
        echo "Qemu_3.0.0-Lubuntu_18.04_64-MonoUser-Quake"
        echo "Qemu_3.0.0-Lubuntu_18.04_64-MultiUser-Doom"
        echo "Qemu_3.0.0-Lubuntu_18.04_64-MultiUser-Hexen"
        echo "Qemu_3.0.0-Lubuntu_18.04_64-MultiUser-Minetest"
        echo "Qemu_3.0.0-Lubuntu_18.04_64-MultiUser-NetPlan"
        echo "Qemu_3.0.0-Lubuntu_18.04_64-MultiUser-Quake"
        echo "Qemu_3.0.0-Lubuntu_18.04_64-MultiUser-Test"
        echo "Qemu_3.0.0-Lubuntu_18.04_64-MultiUser-UfoAI"
        echo "Qemu_4.2.0-FreeBSD_12.1_64-MultiUser-Gnome"
        echo "Qemu_4.2.0-FreeBSD_12.1_64-MultiUser-Minetest"
        echo "Qemu_4.2.0-FreeBSD_12.1_64-MultiUser-XFCE_Doom"
        echo "Qemu_4.2.0-FreeBSD_12.1_64-MultiUser-XFCE"
        echo "Qemu_4.2.0-GhostBSD_20.01_64-MultiUser-Base"
        echo "Qemu_4.2.0-GhostBSD_20.01_64-MultiUser-Crossfire"
        echo "Qemu_4.2.0-GhostBSD_20.01_64-MultiUser-Doom2"
        echo "Qemu_4.2.0-GhostBSD_20.01_64-MultiUser-Doom"
        echo "Qemu_4.2.0-GhostBSD_20.01_64-MultiUser-Minetest"
        echo "Qemu_4.2.0-GhostBSD_20.01_64-MultiUser-Quake"
        echo "Qemu_4.2.0-GhostBSD_20.01_64-MultiUser-Stendhal"
        echo "Qemu_4.2.0-GhostBSD_20.01_64-MultiUser-UHexen2"
        echo "Qemu_4.2.0-Lubuntu_18.04_64-MultiUser-DockerDoom"
        echo "Qemu_4.2.0-Lubuntu_18.04_64-MultiUser-DoomAPI"
        echo "Qemu_4.2.0-Lubuntu_18.04_64-MultiUser-Minetest5"
        echo "Qemu_4.2.0-Lubuntu_19.10_64-MultiUser-Base"
        echo "Qemu_4.2.0-Lubuntu_19.10_64-MultiUser-Doom"
        echo "Qemu_4.2.0-Lubuntu_19.10_64-MultiUser-UsbStick"
        ;;

    h) echo "Help:"
        echo "Qemu version:"
        echo "1 - 2.11.1"
        echo "2 - 2.0.0"
        echo "3 - 4.2.0"
        echo 
        echo "Distribution name:"
        echo "1 - Ubuntu"
        echo "2 - Lubuntu"
        echo "3 - FreeBSD"
        echo "3 - GhostBSD"
        echo 
        echo "Distribution version:"
        echo "1 - 18.04"
        echo "2 - 19.10"
        echo "3 - 12.01"
        echo "3 - 20.01"
        echo 
        echo "Architecture:"
        echo "1 - 32"
        echo "2 - 64"
        ;;

	*) echo "Version not found"
    ;;
esac	


echo "- Distribution -"
case "$2" in
	1) echo "Ubuntu"
	G_DISTRIB=UBUNTU
	;;

	2) echo "Lubuntu"
	G_DISTRIB=LUBUNTU
	;;

	3) echo "FreeBSD"
	G_DISTRIB=FREESBSD
	;;

	4) echo "GhostBSD"
	G_DISTRIB=GHOSTBSD
	;;


	5) echo "LXLE"
	G_DISTRIB=LXLE
	;;

    *) echo "Distribution not found"
    ;;

esac


echo "- Version -"
case "$3" in
	1) echo "18.04"
	G_VERSION=18.04
	;;

	2) echo "19.10"
    G_VERSION=19.10
	;;

	3) echo "12.01"
    G_VERSION=12.01
	;;

	4) echo "20.01"
    G_VERSION=20.01
	;;

	5) echo "16.04"
    G_VERSION=16.04
	;;


    *) echo "Version not found"
    ;;

esac


echo "- Architecture -"
case "$4" in
	1) echo "32"
	G_PROC=32
	;;

	2) echo "64"
	G_PROC=64
	;;
    *) echo "Architecture not found"
    ;;
esac


echo "- Tap -"
TAP=$5


echo "- Virtual disk -"
echo "vda"
VDA=vda

echo "- Application -"
case "$6" in
	*) 
	APP=`echo $6 | tr a-z A-Z`
    echo $APP
	;;
esac


echo "=============================="
echo "Virtual machine configuration:"

echo $QEVER
echo $G_DISTRIB
echo $G_VERSION
echo $G_PROC
echo $VDA
echo $APP

