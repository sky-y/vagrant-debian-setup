#!/bin/bash

set -eu

if ! command -v vagrant > /dev/null 2>&1; then
  echo "先にVagrantをインストールしてください"
  exit 1
fi

dir_vagrant="$HOME/vagrant-debian"

cd "$HOME" || exit 1
[ ! -d "${dir_vagrant}" ] && mkdir "${dir_vagrant}"
cd "${dir_vagrant}" || exit 1

set -x

# vagrant-vbguestプラグインをインストールする
if [[ $(vagrant plugin list | grep -c 'vagrant-vbguest') -eq 0 ]]; then 
  vagrant plugin install vagrant-vbguest
fi

# Vagrantfileが無い場合のみ
if [ ! -f "${dir_vagrant}"/Vagrantfile ]; then
  # VagrantでDebianとして初期設定する
  vagrant init debian/jessie64

  # Vagrantfileを書き換える
  curl -fsSL --insecure https://raw.githubusercontent.com/sky-y/vagrant-debian-setup/master/Vagrantfile > "${dir_vagrant}"/Vagrantfile
fi

# Vagrantを起動する(プロビジョニング付きで)
vagrant up --provider virtualbox --provision

set +x

