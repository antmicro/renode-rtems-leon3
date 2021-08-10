#!/bin/bash
set -euo pipefail

wget https://www.gaisler.com/anonftp/rcc/bin/linux/sparc-rtems-5-gcc-10.2.0-1.3.0-linux.txz
tar -Jxf sparc-rtems-5-gcc-10.2.0-1.3.0-linux.txz
ln -s ~/rcc-1.3.0-gcc/ /opt/
pushd rcc-1.3.0-gcc/src/samples/
make leon3
popd