#!/usr/bin/bash
USERNAME=${VAGRANT_USER:-'vagrant'}

########################################
# Configure System in Chrooted Env
########################################
install --mode=0755 /dev/null  /mnt/provision_scripts/virtualbox.sh
cat <<-EOF > /mnt/provision_scripts/virtualbox.sh
# Guest Editions and allow video resizing
# Info: https://wiki.archlinux.org/index.php/VirtualBox
pacman -S --noconfirm linux-headers virtualbox-guest-utils virtualbox-guest-modules-arch nfs-utils
echo -e 'vboxguest\nvboxsf\nvboxvideo' > /etc/modules-load.d/virtualbox.conf

systemctl enable vboxservice.service
systemctl enable rpcbind.service

# Add groups for VirtualBox folder sharing
usermod --append --groups ${USERNAME},vboxsf ${USERNAME}
EOF

arch-chroot /mnt provision_scripts/virtualbox.sh
