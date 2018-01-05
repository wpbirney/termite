#!/bin/bash

root=$PWD
fakeroot=$PWD/root

cd vte-ng
sed "s/-L\${libdir} -lvte-@VTE_API_VERSION@//" -i vte.pc.in
./autogen.sh --prefix $fakeroot
make install $@
cp ./src/.libs/libvte-2.91.a ${root}/libvte-ng.a
cd $root

export PKG_CONFIG_PATH=${fakeroot}/lib/pkgconfig
make
