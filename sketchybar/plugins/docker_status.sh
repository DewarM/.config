#!/bin/bash

if [ -S /var/run/docker.sock ]; then
  sketchybar --set docker_item icon=󰡨 label=""
else
  sketchybar --set docker_item icon= label=""
fi
