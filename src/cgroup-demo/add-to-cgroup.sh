#!/bin/bash

echo $1

echo Adding session to cgroup by placing $1 into /sys/fs/cgroup/memory/demo/tasks
echo $1 > /sys/fs/cgroup/memory/demo/tasks

