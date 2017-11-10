#!/usr/bin/bash -x

# Write zeros to improve virtual disk compaction.
zerofile=$(/usr/bin/mktemp /mnt/zerofile.XXXXX)
/usr/bin/dd if=/dev/zero of="$zerofile" bs=1M
/usr/bin/rm -f "$zerofile"
/usr/bin/sync
