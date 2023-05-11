#set lib locs etc
export sysdir=/mnt/SDCARD/App
export miyoodir=/mnt/SDCARD/miyoo
export LD_LIBRARY_PATH="$sysdir/ncspot/lib:/lib:/config/lib:$miyoodir/lib:$sysdir/lib:$sysdir/lib/parasyte"				   

#set time and date to a time when ncspot certs were valid or you'll get errors saying they dont exist yet, or aren't valid.. the time doesn't matter
export TZ=UTC+1
ntpd -p time.google.com

#Setup some env vars
export XDG_CONFIG_HOME="/tmp"
export XDG_CACHE_HOME="/tmp"

killall -9 audioserver 

# some cleanup
if pgrep "audiobridge" >/dev/null; then
    pkill -f "audiobridge"
else
    echo ""
fi

/mnt/SDCARD/App/ncspot/bin/ncspot -c /mnt/SDCARD/App/ncspot/config/config.toml