#!/bin/bash

. 1-Initialize_Host_Machine.sh
. 4-Initialize_Guest_Hardware.sh 2048 2
. 6-Configure_Virtual_Machine.sh 3 4 4 2 doom2
. 7-Launch_Virtual_Machine.sh 2
