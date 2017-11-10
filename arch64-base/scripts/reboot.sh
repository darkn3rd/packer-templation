#!/usr/bin/bash -x

# http://comments.gmane.org/gmane.linux.arch.general/48739
echo '==> Adding workaround for shutdown race condition'
/usr/bin/install --mode=0644 /root/poweroff.timer /mnt/etc/systemd/system/poweroff.timer

echo '==> Unmount and Reboot'
/usr/bin/sleep 3
/usr/bin/umount /mnt
/usr/bin/systemctl reboot
