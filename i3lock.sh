#!/bin/sh
scrot -o /tmp/lock.jpg
convert -scale 25% -blur 0x3 -resize 400% /tmp/lock.jpg RGB:- \
	| i3lock --raw $(xdpyinfo | awk '/dimensions/{print $2}'):rgb -i /dev/stdin
rm /tmp/lock.jpg
