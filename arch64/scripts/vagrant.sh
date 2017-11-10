#!/usr/bin/bash
USERNAME=${VAGRANT_USER:-'vagrant'}
PASSWORD=$(openssl passwd -crypt "${VAGRANT_PASSWORD:-'vagrant'}")
PUBKEY="https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub"

########################################
# Configure System in Chrooted Env
########################################
install --mode=0755 /dev/null  /mnt/provision_scripts/vagrant.sh
cat <<-EOF > /mnt/provision_scripts/vagrant.sh
#!/usr/bin/bash

# Vagrant User Configuration
useradd --password ${PASSWORD} --comment 'Vagrant User' --create-home --user-group ${USERNAME}

# Sudoers Vagrant Configuration
echo 'Defaults env_keep += "SSH_AUTH_SOCK"' > /etc/sudoers.d/10_vagrant
echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/10_vagrant
chmod 0440 /etc/sudoers.d/10_vagrant

# SSH Authorization Configuration
install --directory --owner=${USERNAME} --group=${USERNAME} --mode=0700 /home/${USERNAME}/.ssh
curl --output /home/${USERNAME}/.ssh/authorized_keys --location ${PUBKEY}
chown ${USERNAME}:${USERNAME} /home/${USERNAME}/.ssh/authorized_keys
chmod 0600 /home/${USERNAME}/.ssh/authorized_keys
EOF

echo '==> Configure Vagrant User'

arch-chroot /mnt provision_scripts/vagrant.sh
