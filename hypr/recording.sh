#!/bin/env bash

pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && hyprctl notify 1 2000 "rgb(ff0000)" "fontsize:16 Recording is over" && exit 0 

hyprctl notify 1 2000 "rgb(ff0000)" "fontsize:16 Recording is started"

dateTime=$(date +%m-%d-%Y-%H:%M:%S)
# wf-recorder --bframes max_b_frames -f $HOME/Videos/$dateTime.mp4
wf-recorder -a -y -f "$HOME/$dateTime.mp4"
