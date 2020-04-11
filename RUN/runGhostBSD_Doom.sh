#!/bin/bash

if [[ -z "${installpv}" ]] 
then
    echo "1st install"
    export installpv=1
    echo $installpv

    . ./2-Initialize_Network.sh 2
    . ./3-Initialize_Virtualization.sh
fi

echo "2nd install"
echo $installpv

. ./1-Initialize_Host_Machine.sh
. ./4-Initialize_Guest_Hardware.sh 2048 2
. ./6-Configure_Virtual_Machine.sh 3 4 4 2 0 doom
. ./7-Launch_Virtual_Machine.sh 2
