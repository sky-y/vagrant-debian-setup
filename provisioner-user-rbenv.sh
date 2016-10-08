#!/bin/bash
# shellcheck disable=SC2016

# 一般ユーザとして実行すること

set -eu

# プロンプトの変更
echo 'export PS1="[\[\e[35m\]\u\[\e[m\]@\h: \[\e[36m\]\W\[\e[m\]] \\$ "' >> ~/.bashrc

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
target_version='2.3.1'
set -x
if [[ $(rbenv versions | grep -c ${target_version}) -eq 0 ]]; then 
  CONFIGURE_OPTS="--disable-install-rdoc" rbenv install ${target_version}
fi
rbenv global ${target_version}

rbenv exec gem install bundler pry
set +x
