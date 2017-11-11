# **Arch Linux Vagrant Base Image**

This will build a minimalist [Virtualbox](https://www.virtualbox.org/wiki/Downloads) [Vagrant](https://www.vagrantup.com/) image from an [ArchLinux](https://www.archlinux.org/) boot CD ISO image.

## **Building Image**

```bash
packer build build.json
```

## **Installing Image**

```bash
vagrant box add --name darkn3rd/arch64 output/packer_arch_virtualbox.box
```

Vagrant add the image to here:  
* `$HOME/.vagrant.d/boxes/darkn3rd-VAGRANTSLASH-arch64/`

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
