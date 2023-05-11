#!/bin/sh
sysdir=/mnt/SDCARD/.tmp_update
miyoodir=/mnt/SDCARD/miyoo
export LD_LIBRARY_PATH="/lib:/config/lib:$miyoodir/lib:$sysdir/lib:$sysdir/lib/parasyte:$(dirname "$0")/lib"
export PATH="$sysdir/bin:$PATH"
/mnt/SDCARD/App/ncspot/bin/splash /mnt/SDCARD/App/ncspot/logos/splash.png 80 80 80 &
splash_pid=$!
sleep 1
kill -2 $splash_pid
sleep 2
killall -9 splash
/mnt/SDCARD/.tmp_update/bin/st -e sh /mnt/SDCARD/App/ncspot/spotlaunch.sh

