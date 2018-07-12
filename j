#! /bin/sh
set -eux

test -d vendor || bundle install
bundle exec jekyll "$@"
