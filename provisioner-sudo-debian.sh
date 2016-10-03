#!/bin/bash

# スーパーユーザ(sudo)として実行すること

set -eu

# apt: 必要なパッケージをインストールする
echo '[apt: パッケージのインストール]'
set -x
apt-get update
apt-get upgrade
apt-get -y install \
      build-essential \
      apache2 \
      autoconf \
      automake \
      bison \
      ca-certificates \
      curl \
      git \
      libapache2-mod-passenger \
      libc6-dev \
      libc6-dev \
      libffi-dev \
      libncurses5-dev \
      libreadline6 \
      libreadline6-dev \
      libruby \
      libsqlite3-dev \
      libsqlite3-dev \
      libssl-dev \
      libtool \
      libxml2-dev \
      libxslt1-dev \
      libyaml-dev \
      ncurses-dev \
      openssl \
      patch \
      pkg-config \
      rbenv \
      ruby \
      ruby-build \
      ruby-dev \
      sqlite3 \
      zlib1g \
      zlib1g-dev
set +x

