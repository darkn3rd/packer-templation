#!/usr/bin/env bash
echo "=====> Installing User Ruby with Ruby Version Manager"
# install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
sudo sed -iE 's/(gem: --user-install)/#\1/' /etc/gemrc
curl -sSL https://get.rvm.io | bash -s stable
source ${HOME}/.rvm/scripts/rvm
# ruby installs take long time - download/compile
command -v rvm &> /dev/null && rvm requirements
# Install Rubies like Such:
#   `rvm install ruby-2.4.1`
