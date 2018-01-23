#!/bin/bash

export TARGET="/var/new.root"

chroot ${TARGET} /bin/bash
mount -t proc none /proc
