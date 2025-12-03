#!/bin/bash

# Folder containing wallpapers
WALLPAPER_DIR="$HOME/Images/wallpapers"

# Pick a random image
IMAGE=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Apply wallpaper
swww img "$IMAGE" --transition-type random --transition-fps 60
