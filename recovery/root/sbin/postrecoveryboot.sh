#!/sbin/sh
mount /system
finger=$(cat /system/build.prop | grep "ro.build.fingerprint=" | dd bs=1 skip=21)
setprop ro.build.fingerprint $finger
finger=$(cat /system/build.prop | grep "ro.build.date.utc=" | dd bs=1 skip=18)
setprop ro.build.date.utc $finger
mv /system/recovery-from-boot.bak /system/recovery-from-boot.p
mv /shuajizu/ota.apk /data/app/ota.apk
chmod 0644 /data/app/ota.apk
umount /system
