#!/bin/bash
set -uex

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/../vagrant/lib/shell/helpers.sh"

download_to=$(mktemp -d --tmpdir)
steam_srcds="dota2-srcds-linux.tar.gz"
install_in="/home/vagrant/dota2"

# http://unix.stackexchange.com/a/92251
wget  --no-http-keep-alive --output-document=${download_to}/${steam_srcds} "https://forums.alliedmods.net/attachment.php?attachmentid=140208&d=1416970992"

cd ${download_to}
tar xzvf ${steam_srcds}
rm ${steam_srcds}
# todo: Use rsynic instead of cp
cp -fur ./* ${install_in}
cd
rm -r ${download_to}
