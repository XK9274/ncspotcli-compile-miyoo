#!/bin/sh
sysdir=/mnt/SDCARD/.tmp_update
miyoodir=/mnt/SDCARD/miyoo
export LD_LIBRARY_PATH="/lib:/config/lib:$miyoodir/lib:$sysdir/lib:$sysdir/lib/parasyte:$(dirname "$0")/lib"
export PATH="$sysdir/bin:$PATH"

sync

#copies from persistent if exists
if [ ! -d "/tmp/ncspot/librespot" ]; then
    mkdir -p /tmp/ncspot/librespot
fi

if [ -f "/mnt/SDCARD/App/ncspot/config/credentials.json" ]; then
    cp -f /mnt/SDCARD/App/ncspot/config/credentials.json /tmp/ncspot/librespot/
fi

/mnt/SDCARD/App/ncspot/bin/rapid-splash /mnt/SDCARD/App/ncspot/logos/frames 0 0 0 50

killall -9 rapid-splash

/mnt/SDCARD/.tmp_update/bin/st -e sh /mnt/SDCARD/App/ncspot/spotlaunch.sh

# copies to persistent if exists, comment this out to freeze changes to your "permanent" file
if [ -f "/tmp/ncspot/librespot/credentials.json" ]; then
    cp -f /tmp/ncspot/librespot/credentials.json /mnt/SDCARD/App/ncspot/config/
fi

