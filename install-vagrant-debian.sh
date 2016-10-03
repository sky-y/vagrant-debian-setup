#!/bin/bash

set -eu

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
[ -d "${dir_vagrant}" ] && mkdir "${dir_vagrant}"
cd  || exit 1

set -x

# vagrant-vbguestプラグインをインストールする
vagrant plugin install vagrant-vbguest

# VagrantでDebianとして初期設定する
vagrant init debian/jessie64

# Vagrantfileを書き換える
curl https://raw.githubusercontent.com/sky-y/vagrant-debian-setup/master/Vagrantfile > "${dir_vagrant}"/Vagrantfile

# Vagrantを起動する
vagrant up --provider virtualbox

set +x

