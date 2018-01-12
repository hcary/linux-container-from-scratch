#!/bin/bash

source vars.sh

echo "Building new root @ ${TARGET}"
# Get the OS release of the host
cat /etc/os-release | grep PRETTY_NAME
PRETTY_NAME="Ubuntu 16.04.1 LTS"

# pid 1 systemd /sbin/init


which debootstrap
if [ $? == 1 ]; then
    apt-get -y install debootstrap
fi


# Create a new container and network namespace, using Debian stable as the rootfs


if [ -d ${TARGET} ];
then
    rm -rf ${TARGET} 
fi

mkdir ${TARGET}
debootstrap stable ${TARGET} http://httpredir.debian.org/debian/

echo "chroot ${TARGET} /bin/sh" > ${TARGET}/fs-isolate.sh
echo "mount -t proc none /proc" >> ${TARGET}/fs-isolate.sh

