#!/usr/bin/env sh

### polybar
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar top &

### nm-applet
killall -q nm-applet
nm-applet &

### xxkb
# killall -q xxkb
# xxkb &
