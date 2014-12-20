#!/bin/bash
set -uex
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/../vagrant/lib/shell/helpers.sh"

download_to=$(mktemp -d --tmpdir)
steam_runtime="steam-runtime-release_latest.tar.xz"
install_in="/home/vagrant/steam-runtime"

downloadFile "http://media.steampowered.com/client/runtime" ${download_to} ${steam_runtime}

cd ${download_to}
tar xvf ${steam_runtime}
rm ${steam_runtime}
createDirectory ${install_in}
# todo: Use rsynic instead of cp
name=$(find -maxdepth 1 -type d -name '*steam-runtime-release*'| awk 'NR==1')
cp -fur ${name}/* ${install_in}
cd
rm -r ${download_to}
