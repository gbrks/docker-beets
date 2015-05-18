#!/bin/bash

# Check if config.yaml exists. If not, copy in
if [ -f /config/config.yaml ]; then
  echo "Using existing config file."
else
  echo "Creating config.yaml from template."
  wget -P /config/ https://raw.githubusercontent.com/smdion/docker-containers/master/beets/src/config.yaml
  chown nobody:users /config/config.yaml
fi
