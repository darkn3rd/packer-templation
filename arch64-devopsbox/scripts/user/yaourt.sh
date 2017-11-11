#!/usr/bin/env bash
echo "=====> Installing Yaourt and PackageQuery"

# Install Package and Dependencies
sudo pacman -S --noconfirm --needed base-devel git wget yajl

# Fetch Package Query and latest Yaourt from AUR
git clone https://aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd package-query
makepkg --noconfirm -si

cd ../yaourt
makepkg --noconfirm -si

rm -rf yaourt/ package-query/
yaourt -Syu
