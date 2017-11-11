#!/usr/bin/env bash

echo "=====> Installing Docker"
# Install
pacman -S --noconfirm docker docker-compose
# Service
echo "=====> Starting Docker Service"
systemctl start docker
systemctl enable docker
# Post Install Setup
echo "=====> Adding Vagrant to Docker Group"
usermod -aG docker vagrant
