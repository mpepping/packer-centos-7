#!/bin/bash -eux

# FIXME: this should be ported to ansible

# https://github.com/mvermaes/centos-vmware-tools
sudo yum -y install perl gcc fuse make kernel-devel net-tools policycoreutils-python sudo

mkdir -p /tmp/vmware /tmp/vmware-archive
sudo mount -o loop /tmp/linux.iso /tmp/vmware
TOOLS_PATH="`ls /tmp/vmware/VMwareTools-*.tar.gz`"
tar xzf ${TOOLS_PATH} -C /tmp/vmware-archive


sudo /tmp/vmware-archive/vmware-tools-distrib/vmware-install.pl --force-install --default

sudo umount /tmp/vmware
rm -rf /tmp/vmware /tmp/vmware-archive /tmp/*.iso
