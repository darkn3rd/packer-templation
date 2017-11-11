#!/usr/bin/env bash
echo "=====> Installing User Node with Node Version Manager"
# From http://nvm.sh
NVM_VERSION='v0.33.6' # Annoying, VERSION keeps shifting, think they'd make latest
NVM_INSTALL_SCRIPT="https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh"
curl -o- ${NVM_INSTALL_SCRIPT} | bash
# Use NVM immediately
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Install Node & NPM:
#   `nvm install 8`
# Install Packages:
#   `npm -g install grunt mocha bower typescript coffee-script`
