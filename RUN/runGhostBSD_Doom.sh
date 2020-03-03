#!/bin/sh

. 1-Initialize_Host_Machine.sh
. 1-Initialize_Network-enp.sh
. 1-Initialize_Virtualization.sh
. 1-Initialize_Guest_Hardware.sh
. 2-Configure_Virtual_Machine.sh 3 4 4 2 doom2
. 3-Launch_Virtual_Machine.v2.sh
