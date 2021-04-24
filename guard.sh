#!/usr/bin/env bash

set -e -x

cd "$(dirname "$0")"

if (command -v rbenv); then
  RUBY_VERSION="$(cat .ruby-version)"
  test -d "$HOME/.rbenv/versions/$RUBY_VERSION" || rbenv install "$RUBY_VERSION"
fi

bundle install
bundle exec guard
