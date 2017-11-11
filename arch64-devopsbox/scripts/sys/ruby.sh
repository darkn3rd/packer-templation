#!/usr/bin/env bash
echo "=====> Installing Ruby"
# Install
pacman -S --noconfirm ruby
cat <<EOF >> /etc/gemrc
gem: --no-document
EOF
gem install bundler
