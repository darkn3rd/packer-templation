#!/usr/bin/env bash
echo "=====> Installing OpenJDK 8"
pacman -S --noconfirm jdk8-openjdk
echo "=====> Installing OpenJDK 9"
pacman -S --noconfirm  jdk9-openjdk
echo "=====> Defaulting to OpenJDK 8"
archlinux-java set java-8-openjdk
