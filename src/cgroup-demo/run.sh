#!/bin/bash

mkdir /sys/fs/cgroup/memory/demo
echo
echo "------------------------------------------------------"
echo

ls /sys/fs/cgroup/memory/demo/
echo
echo "------------------------------------------------------"
echo

echo "Set memory limit to 100MB by updating /sys/fs/cgroup/memory/demo/memory.limit_in_bytes"
echo "100000000" > /sys/fs/cgroup/memory/demo/memory.limit_in_bytes

echo "Turn off Swap by placing 0 in /sys/fs/cgroup/memory/demo/memory.swappiness"
echo "0" > /sys/fs/cgroup/memory/demo/memory.swappiness

#echo "echo \$$ > /sys/fs/cgroup/memory/demo/tasks"

echo
