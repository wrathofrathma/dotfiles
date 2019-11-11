#!/bin/bash

# Make sure our environmental variables are set. If you're not exporting them from your shell config, this should handle it. 
if [ -z $DOT_FOLDER ]; 
then
  DOT_FOLDER="/opt/dotfiles"
fi

if [ -z $WP_FOLDER ];
then
  WP_FOLDER="/usr/share/wallpapers"
fi

#xrandr --output eDP1 --primary --mode 3840x2160 --rotate normal

# This is my generic autostart file for my different wms 
compton &
#pulseaudio --daemonize=True
xrdb -merge "$DOT_FOLDER/Xresources"
# Reloads sysctl configs so league works.
sysctl -p
# Wallpaper settings
killall -e -9 gnome-rand-back
"$DOT_FOLDER/gnome-rand-background.py" &
start-pulseaudio-x11 &
# Set the cursor icon 
#xsetroot -cursor_name left_ptr

