#!/bin/sh
#
# Run the first time to setup keys
#

set -e

sudo chown packager:packager ~/.abuild/

if [[ ! -f ~/.abuild/*.pub ]]; then
  abuild-keygen -a -i
fi

echo 'http://dl-4.alpinelinux.org/alpine/edge/main' | sudo tee -a /etc/apk/repositories
echo 'http://dl-4.alpinelinux.org/alpine/edge/community' | sudo tee -a /etc/apk/repositories
echo '/target/testing' | sudo tee -a /etc/apk/repositories
echo '/target/community' | sudo tee -a /etc/apk/repositories

sudo apk update

