# vagrant-debian-setup

VagrantでRails開発用のDebianをセットアップするためのスクリプト集。

## ホストOS
### 準備

あらかじめ下記をインストールしておいてください。

- VirtualBox
- Vagrant
- cURL

### VagrantでDebianをインストールする

    curl -fsSL --insecure https://raw.githubusercontent.com/sky-y/vagrant-debian-setup/master/install-vagrant-debian.sh | bash

### キャッシュをクリアしたい場合

`-H 'Cache-Control: no-cache'`オプションを使う。

    curl -fsSL --insecure -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/sky-y/vagrant-debian-setup/master/install-vagrant-debian.sh | bash
