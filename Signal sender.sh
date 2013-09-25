#!/bin/bash
phone_usb_device="usb"
get_ip ()
{
    arp -n | grep $phone_usb_device | awk '{print $1}'
}

#TODO: This needs a timeout and loop needs cleaning up, but works fine and borrowed from another post.
echo "waiting for IP on computer usb"
while [[ `get_ip` < 192 ]];do sleep 2; done
phoneip=`get_ip`
echo "IP adress is $phoneip "

echo -n -e "\x00\x02\x00\x00" | nc -q 2 $phoneip 6000 > /dev/null
