#!/bin/bash
iptables -A POSTROUTING -t nat -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
