#!/usr/bin/env bash
echo "=====> Installing OpenJDK"

pacman -S --noconfirm jdk8-openjdk
pacman -S --noconfirm  jdk9-openjdk
archlinux-java set java-8-openjdk
