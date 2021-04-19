#!/bin/bash
sudo apt-get update
sudo apt-get install build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo
cd ~
git clone git://gcc.gnu.org/git/gcc.git
cd gcc
git checkout releases/gcc-9.3.0
cd ..
git clone git://sourceware.org/git/binutils-gdb.git
cd binutils-gdb
git checkout binutils-2_36_1
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"