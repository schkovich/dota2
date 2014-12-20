#!/bin/bash
#
# To be used with bash based charms on Ubuntu 14.04 LTS.
#
set -uex

# Creates a directory in the specified path
function createDirectory {
  local path="${1:-}"
  # http://unix.stackexchange.com/a/146945
  if [[ -z "${path// }" ]];
  then
    echo "Could not create directory. Empty path given";
    exit 1;
  fi
  if [ ! -d ${path} ]
  then
      mkdir -p ${path};
  fi;
}

# Downloads file in given remote path into given local path
# Expects three arguments: remotepath, localpath, filename
# downloadFile downloadFile https://foohub.com/user/module/archive \
# /home/user/tmp "foohub-1.0.1.tar.gz" willd download file foohub-1.0.1.tar.gz
# from https://foohub.com/user/module/archive to /home/user/tmp
function downloadFile {
  local remotepath="${1:-notdefined}"
  local localpath="${2:-notdefined}"
  local filename="${3:-notdefined}"
  if [ ! -f "${localpath}/${filename}" ]; then
    wget --output-document="${localpath}/${filename}" "${remotepath}/${filename}"
  fi
}

