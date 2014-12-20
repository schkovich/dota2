#!/bin/bash
set -uex
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/../vagrant/lib/shell/helpers.sh"
# todo: Use helpers function to install package
sudo apt-get install unzip

download_to=$(mktemp -d --tmpdir)
dota2_fixups="d2fixups.zip"
install_in="/home/vagrant/dota2/dota/addons/d2fixups"

wget --no-http-keep-alive --output-document=${download_to}/${dota2_fixups} "https://forums.alliedmods.net/attachment.php?attachmentid=140239"

cd ${download_to}
unzip ${dota2_fixups}

createDirectory ${install_in}
# todo: Use rsynic instead of cp
cp -fur addons/d2fixups/* ${install_in}
cp -fur addons/metamod/* ${install_in}/../metamod
cd
rm -r ${download_to}
