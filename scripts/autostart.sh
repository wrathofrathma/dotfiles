#!/bin/bash

if [ -z $DOT_FOLDER ]; 
then
  DOT_FOLDER="/opt/dotfiles"
fi

#xrandr --output eDP1 --primary --mode 3840x2160 --rotate normal

picom -b
#xrdb -merge "$DOT_FOLDER/Xresources"
# Reloads sysctl configs so league works.
#sysctl -p
# Wallpaper settings
killall -e -9 wallpaper.py
/opt/subreddit-wallpapers/wallpaper.py &
#start-pulseaudio-x11 &
