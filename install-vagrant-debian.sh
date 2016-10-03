#!/bin/bash

if ! command -v vagrant > /dev/null 2>&1; then
  echo "先にVagrantをインストールしてください"
  exit 1
fi

if [[ $(vagrant --version) != *"1.8.6"* ]]; then
  echo "Vagrantを最新版にアップデートしてください"
  exit 1
fi

dir_vagrant="$HOME/vagrant-debian"

cd "$HOME" || exit 1
[ -d "${dir_vagrant}" ] && mkdir vagrant-debian
cd  || exit 1

# vagrant-vbguestプラグインをインストールする
echo "vagrant plugin install vagrant-vbguest"
vagrant plugin install vagrant-vbguest

# VagrantでDebianをインストールする
echo "vagrant init debian/jessie64"
vagrant init debian/jessie64

echo "vagrant up --provider virtualbox"
vagrant up --provider virtualbox
