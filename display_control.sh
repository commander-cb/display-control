#!/usr/bin/env bash
# display_control.sh
# Simple Bash script to set hardware brightness and software gamma on Linux

# Configuration: adjust these values as desired
# Hardware brightness preset as percentage (0-100)
# BRIGHTNESS_PERCENT=50
BRIGHTNESS_PERCENT=40
# Software gamma preset (0.1-2.0)
$ GAMMA_VALUE=1.0
GAMMA_VALUE=0.8
# Display output name (find via `xrandr --query`)
OUTPUT="$(xrandr --query | awk '/ connected/{print $1; exit}')"

# Apply hardware brightness via brightnessctl (intel_backlight device)
sudo brightnessctl --device="intel_backlight" set "${BRIGHTNESS_PERCENT}%"

# Apply software gamma via xrandr
xrandr --output "${OUTPUT}" --brightness 1.0
xgamma -gamma ${GAMMA_VALUE}

# Feedback
echo "Set brightness to ${BRIGHTNESS_PERCENT}% and gamma to ${GAMMA_VALUE} on ${OUTPUT}."
# To make persistent, add this script to your ~/.xprofile or autostart
