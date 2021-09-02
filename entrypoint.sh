set -e

./build-rtems.sh
./build-prom.sh

test.sh leon3_rtems.robot

mkdir -p artifacts

cp -r report.html log.html robot_output.xml rcc-1.3.0-gcc/src/samples/bin/leon3/{rtems-shell,rtems-tlib,rtems-hello,rtems-ttcp} grlib-gpl-2021.2-b4267/software/leon3/prom.bin artifacts
