#!/bin/sh

# Network packages:
# apt-get install uml-utilities
# apt-get install bridge-utils
#
# Open: /etc/resolv.conf
# Add: nameserver 8.8.8.8
#

case "$1" in
    1) echo "eth"
        sudo ip addr flush dev eth0
        sudo ip link set eth0 up
        sudo ip link add name br0 type bridge
        sudo ip link set eth0 master br0
        sudo ip addr add 192.168.1.3/24 dev br0
        sudo ip link set br0 up
        sudo ip route add default via 192.168.1.1

        sudo ip tuntap add tap0 mode tap
        sudo ip link set tap0 up
        sudo ip link set tap0 master br0

        sudo brctl show
    ;;

	2) echo "enp"
        networkinterface=`ip addr show | awk '/inet.*brd/{print $NF; exit}'`

        sudo ip addr flush dev $networkinterface
        sudo ip link set $networkinterface up
        sudo ip link add name br0 type bridge

        sleep 2

        sudo ip link set $networkinterface master br0
        sudo ip addr add 192.168.1.3/24 dev br0

        sleep 2

        sudo ip link set br0 up
        sudo ip route add default via 192.168.1.1

        sleep 2 

        sudo ip tuntap add tap0 mode tap
        sudo ip link set tap0 up
        sudo ip link set tap0 master br0

        sleep 2 

        sudo ip tuntap add tap1 mode tap
        sudo ip link set tap1 up
        sudo ip link set tap1 master br0


        sleep 2

        sudo brctl show

        echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf >/dev/null
    ;;

    *) echo "Choose 1 or 2"
    ::
esac


   
