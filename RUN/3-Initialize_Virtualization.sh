#!/bin/bash

sudo modprobe kvm
sudo modprobe kvm-amd

sudo adduser $USER kvm
sudo chown root:$USER /dev/kvm
