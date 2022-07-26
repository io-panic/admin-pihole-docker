#!/bin/sh

script_dir="$( cd -- "$(dirname -- "$0")" && pwd )"
cd $script_dir

$script_dir/cloudflared/build.sh

sudo /usr/libexec/docker/cli-plugins/docker-compose up --force-recreate --build -d
sudo docker image prune -f
