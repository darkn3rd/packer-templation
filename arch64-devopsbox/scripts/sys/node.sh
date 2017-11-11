#!/usr/bin/env bash
echo "=====> Installing Node"

# Install
pacman -S --noconfirm nodejs npm yarn
npm -g install grunt mocha typescript coffee-script
