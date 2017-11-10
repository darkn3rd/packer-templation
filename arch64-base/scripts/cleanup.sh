#!/usr/bin/bash
########################################
# Configure System in Chrooted Env
########################################
install --mode=0755 /dev/null /mnt/provision_scripts/clean.sh
echo '==> Cleanup'
cat <<-EOF > /mnt/provision_scripts/clean.sh
# Clean the pacman cache.
/usr/bin/yes | /usr/bin/pacman -Scc
/usr/bin/pacman-optimize
EOF

arch-chroot /mnt provision_scripts/clean.sh
rm -rf /mnt/provision_scripts/
