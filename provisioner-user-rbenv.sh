#!/bin/bash
# shellcheck disable=SC2016

# 一般ユーザとして実行すること

set -eu

# rbenvのセットアップ
echo '[.bash_profile: rbenvの設定]'
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

echo '[.gemrcの設定]'
echo 'install: --no-document' >> ~/.gemrc
echo 'update: --no-document' >> ~/.gemrc

# rbenvでRubyをインストール
echo '[rbenvでRubyをインストール]'
set -x
CONFIGURE_OPTS="--disable-install-rdoc" rbenv install 2.3.1
rbenv global 2.3.1
rbenv rehash
rbenv exec gem install bundler pry
set +x
