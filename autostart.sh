#!/bin/bash

# Make sure our environmental variables are set. If you're not exporting them from your shell config, this should handle it. 
if [ -z $DOT_FOLDER ]; 
then
  DOT_FOLDER="$HOME/.dotfiles"
fi

if [ -z $WP_FOLDER ];
then
  WP_FOLDER="/usr/share/wallpapers"
fi

xrandr --output eDP1 --primary --mode 3840x2160 --rotate normal

# This is my generic autostart file for my different wms 
exec compton &
exec pulseaudio --daemonize=True
exec xrdb -merge "$DOT_FOLDER/Xresources"

# Wallpaper settings
# WP_TYPE can be any type of bg that feh supports. --bg-fill, --bg-center, --bg-scale --bg-max --bg-tile
WP_TYPE=--bg-center
M1_WP=ylia.jpg
WP_FINAL="$WP_TYPE $WP_FOLDER/$M1_WP"

feh $WP_FINAL

# Set the cursor icon 
xsetroot -cursor_name left_ptr

