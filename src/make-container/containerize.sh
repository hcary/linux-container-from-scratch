#!/bin/bash

source vars.sh

# ip netns allows applications that are namespace unware run in a separate network namespace
ip netns add netns1
unshare --mount --uts --ipc --net=/var/run/netns/netns1 --pid --fork sh

