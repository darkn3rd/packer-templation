#!/usr/bin/env bash
echo "=====> Installing Go Language"
sudo pacman -S --noconfirm go
echo 'export GOPATH=${HOME}/go' >> ~/.bashrc
echo 'export PATH=${GOPATH}/bin:${PATH}' >> ~/.bashrc
