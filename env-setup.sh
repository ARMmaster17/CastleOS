#!/bin/bash
sudo apt-get update
sudo apt-get install build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo
cd ~
git clone git://gcc.gnu.org/git/gcc.git
cd gcc
git checkout releases/gcc-9.3.0
cd ..
# TODO: Make build tree in separate directory
git clone git://sourceware.org/git/binutils-gdb.git
cd binutils-gdb
git checkout binutils-2_36_1
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"
configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make
make install
# TODO: Make build tree in separate directory
cd ../gcc
configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc