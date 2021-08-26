#!/bin/bash
set -euo pipefail

wget --no-verbose 'https://www.gaisler.com/anonftp/bcc2/bin/bcc-2.2.0-gcc-linux64.tar.xz'
tar xf bcc-2.2.0-gcc-linux64.tar.xz

wget --no-verbose 'https://www.gaisler.com/products/grlib/grlib-gpl-2021.2-b4267.tar.gz'
tar xf grlib-gpl-2021.2-b4267.tar.gz

export PATH="$PATH:$PWD/bcc-2.2.0-gcc/bin"

pushd grlib-gpl-2021.2-b4267/software/leon3
cp ../../../prom.h .
cp ../../designs/leon3-asic/linkprom .
sed -i s/sparc-elf-/sparc-gaisler-elf-/ Makefile

make prom.exe
sparc-gaisler-elf-objcopy -O binary prom.exe prom.bin
popd
