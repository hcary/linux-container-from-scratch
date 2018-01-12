#!/bin/bash

mkdir /sys/fs/cgroup/memory/demo
ls /sys/fs/cgroup/memory/demo/

echo "100000000" > /sys/fs/cgroup/memory/demo/memory.limit_in_bytes
echo "0" > /sys/fs/cgroup/memory/demo/memory.swappiness

echo "echo \$$ > /sys/fs/cgroup/memory/demo/tasks"

echo
