#!/bin/bash
set -uex

# Creates a directory in the given path
# Makes parent directories as needed
# Exits case empty path is given
function createDirectory {
  local path="${1:-}"
  # http://unix.stackexchange.com/a/146945
  if [[ -z "${path// }" ]];
  then
    juju-log "Could not create directory. Empty path given";
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
    wget "${remotepath}/${filename}" --output-document="${localpath}/${filename}"
  fi
}

