# **Arch Linux DevOps-Box Image**

This creates a DevOps Box (language platforms, change config. tools, docker) from an existing [ArchLinux](https://www.archlinux.org/) base system.

## **Prerequisites**

You must have an existing [ArchLinux](https://www.archlinux.org/) system that is configured with [Vagrant guidelines](https://www.vagrantup.com/docs/boxes/base.html) for [Virtualbox](https://www.virtualbox.org/wiki/Downloads), either built from before, or downloaded from a public source.

You need to save a variable containing the location of the vagrant box.

On Linux or MacOS X:

```bash
vagrant box add --name darkn3rd/arch64 ../arch64-base/output/packer_arch_virtualbox.box
BOXVER=0
PROVIDER=virtualbox
BOXNAME=darkn3rd-VAGRANTSLASH-arch64
BOXEN="${HOME}/.vagrant.d/boxes/"
export SOURCE_PATH="${BOXEN}/${BOXNAME}/${BOXVER}/${PROVIDER}/box.ovf"
```

On Windows:

```PowerShell
$BOXVER = '0'
$PROVIDER = 'virtualbox'
$BOXNAME = 'darkn3rd-VAGRANTSLASH-arch64'
$BOXEN = "$HOME\.vagrant.d\boxes"
$SOURCE_PATH = "$BOXEN\$BOXNAME\$BOXVER\$PROVIDER\box.ovf"
```

## **Building Image**

You may want to edit the create a copy of the `build.json` to custom tailor packages as desired.  Some packages will have a requirement to `yaourt` tool.

```bash
# See Prerequisites for defining $SOURCE_PATH
packer build -var "source_path=$SOURCE_PATH" build.json
```

This system is given 4 CPUs and 4 GB of memory, but if your system can support, you can override the defaults:

```bash
packer build \
  -var "source_path=$SOURCE_PATH" \
  -var "build_cpus=4" \
  -var "build_memory=4096" \
  build.json

```


## **Installing Image**

```bash
vagrant box add --name darkn3rd/devopsbox-arch64 output/devopsbox_arch_virtualbox.box
```
