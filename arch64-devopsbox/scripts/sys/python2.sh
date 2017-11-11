#!/usr/bin/env bash
echo "=====> Installing Python2"
pacman -S --noconfirm python2 python2-setuptools python2-pip python2-virtualenv
pip2 install --upgrade pip setuptools
