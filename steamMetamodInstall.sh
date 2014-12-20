#!/bin/bash
set -uex
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/../vagrant/lib/shell/helpers.sh"

download_to=$(mktemp -d --tmpdir)
steam_metamod="mmsource-1.10.5-git926-linux.tar.gz"
install_in="/home/vagrant/dota2"

downloadFile "http://www.metamodsource.net/mmsdrop/1.10" ${download_to} ${steam_metamod}

cd ${download_to}
tar xvf ${steam_metamod}
rm ${steam_metamod}

# todo: Use rsynic instead of cp
cp -fur ./* ${install_in}
cd
rm -r ${download_to}
