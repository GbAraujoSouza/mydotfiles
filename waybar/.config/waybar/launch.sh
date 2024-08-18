#!/bin/sh
############################################3######
# Quit running waybar instances #
############################################3######
killall waybar


############################################3######
# Loading the configuration based on the username #
############################################3######
if [[ $USER = "gbaraujosouza" ]] then
  waybar -c ~/.config/waybar/config.jsonc & -s ~/.config/waybar/style.css
else
  waybar &
fi
