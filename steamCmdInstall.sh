#!/bin/bash
set -uex
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/../vagrant/lib/shell/helpers.sh"

download_to=$(mktemp -d --tmpdir)
steam_cmd="steamcmd_linux.tar.gz"
install_in="/home/vagrant/steamcmd"

downloadFile "http://media.steampowered.com/installer" ${download_to} ${steam_cmd}

cd ${download_to}
tar xzvf ${steam_cmd}
rm ${steam_cmd}
createDirectory ${install_in}
cp -fur ./* ${install_in}
cd
rm -r ${download_to}
