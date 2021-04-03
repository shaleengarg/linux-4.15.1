#!/bin/bash -x
sudo apt-get install -y libdpkg-dev kernel-package

PROC=`nproc`
export CONCURRENCY_LEVEL=$PROC
export CONCURRENCYLEVEL=$PROC

touch REPORTING-BUGS
make distclean
make menuconfig
fakeroot make-kpkg clean
sudo fakeroot make-kpkg -j --initrd kernel-image kernel-headers
sudo dpkg -i ../*image*.deb ../*header*.deb
exit
