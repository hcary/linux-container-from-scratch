#!/bin/bash

# In a separate process, configure the new network namespace
ip link add veth0 type veth peer name veth1
ip link set veth1 netns netns1
ip addr add 172.16.99.1/24 dev veth0
ip link set veth0 up
ip netns exec netns1 ip addr add 172.16.99.100/24 dev veth1
ip netns exec netns1 ip link set lo up
ip netns exec netns1 ip link set veth1 up
ip netns exec netns1 ip route add default via 172.16.99.1
