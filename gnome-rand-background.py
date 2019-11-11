#!/usr/bin/python3
from os import system, listdir
from time import sleep
from random import randint
import json

# One day we'll load a json settings file. For now I'll just hardcode the folders & interval. 
# Resets right now every 30m
def load_settings():
    settings = { "interval" : 60*30, "folders" : [ "/usr/share/wallpapers" ]}
    return settings
# Sets the backgroudn 
def set_background(bg):
    cmd = "gsettings set org.gnome.desktop.background picture-uri file://" + bg
    system(cmd)
    

# Returns the uri of a random background. 
def get_rand_background(wp_list):
    return wp_list[randint(0, len(wp_list)-1)]

def create_wp_list(settings):
    wp_list = []
    for folder in settings["folders"]:
        wp_list += [ folder + "/" + f for f in listdir(folder)]
    return wp_list

if __name__=="__main__":
    settings = load_settings()
    wp_list = create_wp_list(settings)

    # Event loop 
    while(True):
        background = get_rand_background(wp_list)
        set_background(background)
        sleep(settings["interval"])

