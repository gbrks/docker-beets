#!/bin/sh

# Check if config.yaml exists. If not, copy in
if [ -f /config/config.yaml ]; then
  echo "Using existing config file."
else
  echo "Creating config.yaml from template."
  cp /home/beets/config.yaml /config/
fi
