#!/bin/bash
# Wait briefly for GNOME audio services to initialize
sleep 1.5

# Play startup chime
mpv --no-terminal ~/.local/share/sounds/custom/startup.wav

# Play voice greeting
mpv --no-terminal ~/.local/share/sounds/custom/greeting.mp3
