# :rocket: Fast Blur i3lock
Using `i3lock` with  a blurred screenshot of the current desktop is really popular. However, PNG encoding and blurring are two steps that can make locking quiet slow, especially for high resolutions.

The common approach would look like this:
```sh
#!/bin/sh

# take screenshot
scrot -o /tmp/lock.png
# blur image
convert -blur 0x3 /tmp/lock.png /tmp/lock.png
# start i3lock with saved image
i3lock -i /tmp/lock.png
# delete image
rm /tmp/lock.png
```

Improvements of the provided script:
* Save screenshot as JPG (~ 4 times faster)
* Scale down image before blurring and scale up afterwards (~ twice as fast)
* Don't save blurred image as PNG but write it to stdout in raw format (~ 3.3 times as fast)
* Read image for i3lock from stdin in raw format instead of a PNG file

All steps combined lead to a 4.8 time speedup on my machine (original takes 2.2 sec vs improved only 0.45 sec).

## :package: Dependencies
Following packages must be installed:
* scrot
* imagemagick
* i3lock

## :gear: Usage
* Place the `i3lock.sh` in a directory of your choice, for example in `~/scripts/`
* Set a keyboard shortcut to the script, depending on your desktop environment\
  For example:
  * _i3_: In your `~/.config/i3/config` (or `~/.i3/config`) add `bindsym $mod+l exec ~/scripts/i3lock.sh`
  * _xfce_: Use `xfce4-keyboard-settings`
  * ...
