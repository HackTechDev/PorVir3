#!/bin/bash

if [[ ! -f ".lock" ]] 
then
    echo "1st install"
    echo "1" > .lock

    . 2-Initialize_Network.sh 2
    . 3-Initialize_Virtualization.sh
fi

echo "2nd install"


. ./1-Initialize_Host_Machine.sh
. ./4-Initialize_Guest_Hardware.sh 2048 2
. ./6-Configure_Virtual_Machine.sh 3 5 1 2 0 nethack
. ./7-Launch_Virtual_Machine.sh 2
