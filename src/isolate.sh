#!/bin/bash

chroot ${TARGET} /bin/sh
mount -t proc none /proc