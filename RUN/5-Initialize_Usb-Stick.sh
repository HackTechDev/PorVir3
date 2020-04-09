#!/bin/bash

export INFOUSBKEY=`dmesg |grep "New USB device found" |tail -1 |sed "s/.*idVendor=\(....\), idProduct=\(....\).*/\1 \2/"`
DMESGVENDORID=`echo $INFOUSBKEY | cut -d" "  -f1`
DMESGPRODUCTID=`echo $INFOUSBKEY | cut -d" "  -f2`

echo $DMESGVENDORID $DMESGPRODUCTID

USBLIST=$(lsusb | sed "s/^Bus \(...\) Device \(...\): ID \(....\):\(....\).*/\1 \2 \3 \4/")
while read i 
do 
    HOSTBUS=`echo $i | cut -d" "  -f1`
    HOSTADDR=`echo $i | cut -d" "  -f2`
    VENDORID=`echo $i | cut -d" "  -f3`
    PRODUCTID=`echo $i | cut -d" "  -f4`
    if [ "$VENDORID" == "$DMESGVENDORID" ] && [ "$PRODUCTID" == "$DMESGPRODUCTID" ] 
    then
        echo $HOSTBUS $HOSTADDR $VENDORID $PRODUCTID
        break
    fi
done <<< "$USBLIST"


sudo chmod 666 /dev/bus/usb/$HOSTBUS/$HOSTADDR

