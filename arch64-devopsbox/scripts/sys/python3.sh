#!/usr/bin/env bash
echo "=====> Installing Python3"
pacman -S --noconfirm python python-setuptools python-pip python-virtualenv python-virtualenvwrapper
pip install --upgrade pip setuptools
# NOTE: Never install packages with pip if it already exist as system package.
#  Other system pacakages will fail if existing .egg or .pyc exist of the same
#  name.
#
# Example: pip install PyYAML && pacman -S docker-compose
