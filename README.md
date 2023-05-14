# ncspot Spotify client for the MMP.
## audiobridge - https://github.com/XK9274/audiobridge-miyoo
## splash - https://github.com/XK9274/splash-miyoo

- Bit of a novelty/gimmick this app really but it's been a fun build/process and i've learnt a lot about the MMP/embedded environment from it.
- If you have a lot of background apps running (filebrowser etc) it may be worth killing them to free up some memory
- There's other spotify options that may be better (designed for embedded found by kebabstorm) which i'll also look into
- Headphones work

![ncspot_000](https://github.com/XK9274/ncspotcli-compile-miyoo/assets/47260768/2e145ea8-f3a4-42bd-85b2-6a83ecaf72b7)
![ncspot_000s](https://github.com/XK9274/ncspotcli-compile-miyoo/assets/47260768/0bb71918-a309-438d-949a-9ffc92930e32)

AND with eggs new terminal (larger, clearner font) found here: https://www.dropbox.com/s/56pr1io9e82po8s/Terminal_640x480.zip (install st in .tmp_update/bin)

![ncspot_000](https://github.com/XK9274/ncspotcli-compile-miyoo/assets/47260768/ac0ac14c-da4b-4650-bd99-df4e005984bd)
![ncspot_005](https://github.com/XK9274/ncspotcli-compile-miyoo/assets/47260768/b78c4e84-7d02-4879-9ff3-015a6315d090)

### Credits:
- eggs for his terminal (and the new terminal!): https://github.com/OnionUI/app-Terminal https://www.dropbox.com/s/56pr1io9e82po8s/Terminal_640x480.zip
- ncspot: https://github.com/hrkfdn/ncspot
- Spotify logo usage: https://developer.spotify.com/documentation/design#using-our-logo
### Usage
- Copy the App folder to your /mnt/SDCARD folder
- or
- Copy the ncspot folder to your App folder

On the login screen:
Use the keyboard to input username, press the `Select` button to tab down, input password, press `Select` button again to tab to login and press start. When logged in press `X` to hide the keyboard.

You may need to restart your MMP

### Building
To build fresh from the source, i've included a mk.sh file that you can run from a docker image, the best docker image to use i've found is:

```
git clone https://github.com/shauninman/union-miyoomini-toolchain.git
cd union-miyoomini-toolchain
make shell
```

copy the mk.sh file to your workspace

`source mk.sh`

This will build the requirements with NO audio backends, it will rely on the audiobridge.

## TODO/Issues: 

### Performance
- Not great..
- Not bad if you dont have the mmp loaded up with apps in the background, not *great* all round though

### App
- The current credentials file gets stored in /tmp/ so it resets every boot, i'm tempted to leave it this way due to the nature of the MMPs security - this file contains tokens and secrets
- You need a premium account, no getting around this - it's a librespot/spotify thing
- You can't background the app, terminal closing will kill the child processes'
- You can't background the app, no really, the mmp really doesn't have enough memory to run Main and ncspot.
- It's the same story if you turn the screen off, the audio will stop.
- ~Sometimes audio gets buggy, tap the power button twice to repair~ \\ This is resolved since preloading with built in audioserver
- Sometimes just changes song all on its own \\ Very rare
- You'll potentially get a stutter about 10 seconds in, this is ncspot downloading track and databases

### terminal
- ~May try a completely different terminal~ Use eggs new terminal
- Terminal app source needs editing to provide some more keys from SDLK that we can use as volume
- Bind some volume keys. 
- ~New font as the current pixel one doesn't display great for ncurses built tuis~ Use eggs new terminal
- There's no keyboard with ncspot so you NEED to use the terminal keyboard to login (select is tab to next field), you can then hide the keyboard with the X button

### Audio
- Now uses built in audioserver, no longer pops when changing song (still uses audiobridge as the bridge across ncspot and audioserver in absence of an ncspot sdl backend/sink)
- Added a buffer to audiobridge, added rewind for EOF but not sure this is working on STDIN
- Full volume audio is distorted - Use 75% with the volume keys or change the ncspot volume with the keyboard.
- ncspot starts every song with the volume set in the app, not the volume set in the audiobridge. You can change this by bringing up the keyboard with the X button and pressing +/- (volume is in the far bottom right of the screen)
- Now correctly handles mute/unmute with the mmp keys

### Key bindings
## These are the key bindings due to how the terminal app (and ncspot) are setup

https://github.com/hrkfdn/ncspot/blob/main/doc/users.md#vim-like-commands this is the full list, you can pull up the keyboard with the X button and use these commands

- Start button - play song
- Arrow keys - navigate
- "Backspace" = "quit" # This is the R2 button
- "t" = "next" # This is the R1 button
- "e" = "previous" # This is the L1 button
- "Tab" = "focus library" # This is the L2 Button
- "Space" = "playpause"  # This is the A button
- "Alt+e" = "search" # This is the Y & L1 buttons

### Theme setup
- Edit the config.toml to suit your theme needs, it should accept hex but it doesn't very well and i think this is an st (terminal app) thing as it works fine if you launch from putty.



