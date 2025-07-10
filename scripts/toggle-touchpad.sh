#!/bin/bash

DEVICE_NAME="elan0307:00-04f3:3282-touchpad" # Replace with your actual device name

STATUS=$(hyprctl devices | awk -v dev="$DEVICE_NAME" '
    $0 ~ dev {found=1}
    found && /enabled/ {
        print $2
        exit
    }')

if [ "$STATUS" = "true" ]; then
  hyprctl keyword input:touchpad:enabled false
else
  hyprctl keyword input:touchpad:enabled true
fi
