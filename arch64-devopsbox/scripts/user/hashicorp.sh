#!/usr/bin/env bash
echo "=====> Installing Packer-IO and Consul"
sudo pacman -S --noconfirm packer-io consul
echo "=====> Installing Nomad, Consul-Template, Vault, and Serf-Cluster"
yaourt -S --noconfirm nomad consul-template vault serf-cluster
