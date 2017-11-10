# **Arch Linux Base Image**

This will build a [Virtualbox](https://www.virtualbox.org/wiki/Downloads) [Vagrant](https://www.vagrantup.com/) image from ISO of [ArchLinux](https://www.archlinux.org/) boot CD

## **Building Image**

```bash
packer build build.json
```

## **Installing Image**

```bash
vagrant box add --name darkn3rd/arch64 output/packer_arch_virtualbox.box
```

Vagrant creates `$HOME/.vagrant.d/boxes/darkn3rd-VAGRANTSLASH-arch64/box.ovf` afterward.

## **Testing Image**

```bash
# create vms workarea
mkdir $HOME/test
cd $HOME/test
# generate config file
vagrant init darkn3rd/arch64
# start virtual system
vagrant up
# log into virtual system
vagrant ssh
# Run tests
cat /etc/os-release
```
