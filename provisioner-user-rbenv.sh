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

# ruby-buildのインストール
echo '[ruby-buildのインストール]'
dir_ruby_build="$HOME/.rbenv/plugins/ruby-build"
if [ ! -d "${dir_ruby_build}" ] ; then
  set -x
  git clone https://github.com/sstephenson/ruby-build.git "${dir_ruby_build}"
  set +x
fi

# rbenvでRubyをインストール
echo '[rbenvでRubyをインストール]'
set -x
CONFIGURE_OPTS="--disable-install-rdoc" rbenv install 2.3.1
rbenv global 2.3.1
rbenv exec gem install bundler pry
set +x
