#!/bin/bash

# Check if config.yaml exists. If not, copy in
if [ -f /config/config.yaml ]; then
  echo "Using existing config file."
else
  echo "Creating config.yaml from template."
  wget -P /config/ https://raw.githubusercontent.com/gbrks/docker-beets/master/src/config.yaml
  chown $USERID:users /config/config.yaml
fi
