#!/bin/bash

#export TARGET="/var/new.root"

chroot ${TARGET} /bin/sh
mount -t proc none /proc
