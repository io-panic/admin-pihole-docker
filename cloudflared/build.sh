#!/bin/sh
# "binutils" package must be installed

script_dir="$( cd -- "$(dirname -- "$0")" && pwd )"
cd $script_dir

[ -f tmp ] || rm -rf tmp
[ -d tmp/alphine ] || mkdir -p tmp/alpine

####
#### GET LATEST alpine linux
####

latest_file_name=$(curl -s "https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/latest-releases.yaml" | grep 'file:' | grep -o 'alpine-minirootfs.*gz')

echo $latest_file_name

# Download the latest version of alpine linux
curl -s "https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/$latest_file_name" --output tmp/alpine/alpine-minirootfs-latest.tar.gz

####
#### GET LATEST cloudflared package
####

wget -O cloudflared-linux-amd64.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb

ar -x --output tmp cloudflared-linux-amd64.deb
tar -xvf tmp/data.tar.gz -C tmp/

sudo docker build --tag cloudflared .

[ -f tmp ] || rm -rf tmp
[ -f cloudflared-linux-amd64.deb ] || rm -rf cloudflared-linux-amd64.deb
