#!/usr/bin/bash
LANGUAGE=${LANGUAGE:-'en_US.UTF-8'}
REGION=${REGION='America'},
CITY=${CITY:-'Los_Angeles'}
ZONE="${REGION}/${CITY}"
FQDN=${FQDN:-'vagrant-arch64.dev'}
PASSWORD=$(openssl passwd -crypt "${ROOT_PASSWORD:-'vagrant'}")

########################################
# Setup Partitions
########################################
echo '==> Setup Partitions'
fdisk /dev/sda << FDISK_EOF
n
p
1


w
y
FDISK_EOF

# Format Disk
echo '==> Format Partitions'
mkfs.ext4 /dev/sda1
# Mount Disk
echo '==> Mount Partition'
mount /dev/sda1 /mnt

########################################
# Install Base Package Groups and fstab
########################################
echo '==> Install Base Pacakages and generate fstab'
pacstrap /mnt base base-devel linux
genfstab /mnt >> /mnt/etc/fstab
mkdir /mnt/provision_scripts

########################################
# Configure System in Chrooted Env
########################################
echo '==> Configure Base'
install --mode=0755 /dev/null  /mnt/provision_scripts/base.sh
cat <<-BASE_EOF > /mnt/provision_scripts/base.sh
#!/usr/bin/bash

# Locale
sed -i "s/#${LANGUAGE}/${LANGUAGE}/" /etc/locale.gen
echo "LANG=${LANGUAGE}" > /etc/locale.conf
locale-gen

# Time Zone: Set time zone and generate /etc/adjtime:
ln -sf /usr/share/zoneinfo/${ZONE} /etc/localtime
hwclock --systohc --utc

# Hostname: Create the hostname file
echo "${FQDN}" > /etc/hostname

# Root Password
usermod --password ${PASSWORD} root

# enable DHCPD
systemctl enable dhcpcd

# SSH: Install/Enable SSH
pacman -S --noconfirm openssh
systemctl enable sshd.service

# BootLoader
pacman -S --noconfirm grub os-prober
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
BASE_EOF

arch-chroot /mnt provision_scripts/base.sh
