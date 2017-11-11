#!/usr/bin/bash

# Clean the pacman cache.
/usr/bin/yes | /usr/bin/pacman -Scc
/usr/bin/yes | /usr/bin/yaourt -Scc
/usr/bin/pacman-optimize
