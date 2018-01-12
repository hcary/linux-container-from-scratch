#!/bin/bash

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -P FORWARD DROP
iptables -F FORWARD
iptables -t nat -F
iptables -t nat -A POSTROUTING -s 172.16.99.100/24 -o enp0s3 -j MASQUERADE
iptables -A FORWARD -i enp0s3 -o veth0 -j ACCEPT
iptables -A FORWARD -o enp0s3 -i veth0 -j ACCEPT