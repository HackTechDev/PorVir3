#!/bin/bash

MACADDRESS=`printf 'DE:AD:BE:EF:%02X:%02X' $((RANDOM%256)) $((RANDOM%256))`

currentuser="$(whoami)"

# Host configuration

echo "== Run Virtualization =="

if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    H_DISTRIB=$NAME
    H_VERSION=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    H_DISTRIB=$(lsb_release -si)
    H_VERSION=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    H_DISTRIB=$DISTRIB_ID
    H_VERSION=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    ...
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    ...
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    H_DISTRIB=$(uname -s)
    H_VERSION=$(uname -r)
fi

case $(uname -m) in
x86_64)
    H_PROC=64
    ;;
i*86)
    H_PROC=32
    ;;
*)
    H_PROC=?
    ;;
esac

H_DESKTOP=`env | grep DESKTOP_SESSION=`
H_DESKTOP=$(echo $H_DESKTOP | cut -f2 -d=)
H_DISTRIB=$(echo "$H_DESKTOP" | tr '[:lower:]' '[:upper:]')

echo "Host machine:"
echo $H_DISTRIB $H_VERSION $H_PROC
