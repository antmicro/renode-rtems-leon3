set -e

./build-rtems.sh
./build-prom.sh

test.sh leon3_rtems.robot
