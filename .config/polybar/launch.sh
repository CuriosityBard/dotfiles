#!/bin/sh

# terminate existing instances
killall -q polybar

# wait for processes to shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch bar 
MONITORS=$(xrandr --query | grep " connected" | cut -d" " -f1)

MONITORS=$MONITORS polybar main;

echo "Bars launched..."
