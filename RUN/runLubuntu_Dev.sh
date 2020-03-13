#!/bin/bash

. 1-Initialize_Host_Machine.sh
. 2-Initialize_Network.sh 2
. 3-Initialize_Virtualization.sh
. 4-Initialize_Guest_Hardware.sh 2048 2
. 5-Initialize_Usb-Stick.sh
. 6-Configure_Virtual_Machine.sh 3 2 2 2 usbstick
. 7-Launch_Virtual_Machine.sh 2
