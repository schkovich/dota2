#!/bin/bash
set -uex
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/../vagrant/lib/shell/helpers.sh"

createDirectory "/home/vagrant/dota2"

cd /home/vagrant/steamcmd
./steamcmd.sh +runscript "$DIR/../vagrant/dota2.cmd"
