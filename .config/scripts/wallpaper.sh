#!/bin/bash

magick convert -crop 50%x100% $HOME/Images/wallpaper.png $HOME/Images/tmp/output.png

swww img -o "DP-1" $HOME/Images/tmp/output-0.png
swww img -o "DP-2" $HOME/Images/tmp/output-1.png
