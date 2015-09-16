#!/bin/bash
#############################################
## forkerd from: vitamins/archinstaller
# inspired by archmind-script 2.1
# respect the 5 freedom of freesoftware
#test-preview 0.1b
######bootloader
###UEFI set on/off
clear
echo "BOOTLOADER OPTIONS
There is an UEFI active? type in yes/no answer  "
read selection
case $selection in
  yes) echo uefi=\'yes\' >> ari.conf ;;
  no)  echo uefi=\'no\' >> ari.conf ;;
  *) ;;
esac
###grub/grummy
clear
echo "1.UEFI:	(grub/gummiboot)
2.BIOS:	(grub/syslinux)
select an alternative than press Enter  "
read selection
case $selection in
  1) echo bootloader=\'gummiboot\' >> ari.conf ;;
  2) echo bootloader=\'syslinux\' >> ari.conf ;;
  *);;
esac
############## PARTITIONING OPTIONS
###manual partitioning (yes/no)
clear
echo "Manual partitioning (yes/no)"
read selection
case $selection in
  yes) echo manual_part=\'yes\' >> ari.conf ;;
  no) echo manual_part=\'no\' >> ari.conf ;;
  *);;
esac
if [ $selection = 'no' ]; then
  echo "select drive to be formatted ex.(/dev/sda)   "
  read drive
  echo dest_disk=\'$drive\' >> ari.conf
  echo "create swap partition? type in yes/no"
read swap
case $swap in
  yes) echo swap=\'yes\' >> ari.conf ;;
  no) echo swap=\'no\' >> ari.conf ;;
  *) ;;
esac
echo "create home partition, type in (yes/no)  "
read selection
case $selection in
  yes) echo home=\'yes\' >> ari.conf ;;
  no) echo home=\'no\' >> ari.conf ;;
  *) ;;
esac
echo "encrypt home partition, type in (yes/no) "
read selection
case $selection in
  yes) echo encrypt_home=\'yes\' >> ari.conf ;;
  no) echo encrypt_home=\'no\' >> ari.conf ;;
  *);;
esac
echo "type in swap partition size, (ex: 500M)"
read swap_size
echo "type in root partition size, (ex: 25G)"
read root_size
echo "type home partition size (Set 0 for the last partition to fill the remaining space. )"
read home_size
echo swap_size=\'$swap_size\' >> ari.conf
echo root_size=\'$root_size\' >> ari.conf
echo home_size=\'$root_size\' >> ari.conf

echo "filesystem for root and home partition
possible values: (btrfs/ext2/ext3/ext4/f2fs/jfs/nilfs2/reiserfs/xfs)    "
read fstype
echo fstype=\'$fstype\' >> ari.conf
else
  echo "manual partitioning. "
fi
########mirror
clear
echo "mirror
To use the mirrorlist from the install host, set mirror to 'keep'.
example: http://mirrors.kernel.org/archlinux/      "
read mirror
echo mirror=\'$mirror\' >> ari.conf
#####language
clear
echo "language, example: en_US.UTF-8 UTF-8"
read locale_conf
echo locale=\'$locale_conf\' >> ari.conf
#####keyboard
clear
echo "type in for keybord configuration. example: it / en / us / fr / de
"
read keymap
echo keymap=\'$keymap\' >> ari.conf
#######timezone
clear
echo "type timezone
example:
Europe/Berlin
Africa/Freetown
America/Argentina/Buenos_Aires
  "
read timezone
echo timezone=\'$timezone\' >> ari.conf
######hardware clock
clear
echo "type 1 for UTC, type 2 for localtime  "
read selection
case $selection in
  '1') echo hardware_clock=\'utc\' >> ari.conf ;;
  '2') echo hardware_clock=\'localtime\' >> ari.conf ;;
  *) ;;
esac
####### mkinitcpio hooks
clear
echo "type in mkinitcpio hooks, Leave empty to skip.
example: base udev autodetect block filesystems  "
read selection
echo hook=\'$selection\' >> ari.conf
#####kernel modules
clear
echo "kernel commandline
 Only required for manual partitioning, ignored otherwise.
 example: root=/dev/sda1 rw quiet"
read kcommandline
echo cmdline=\'$kcommandline\' ari.conf
##hostname
echo "hostname, type your hostname"
clear
read selection
echo hostname=\'$selection\' >> ari.conf
# network service
clear
echo "network service, to skip network configuration, set network to 'no'.
possible values: (no/dhcpcd/ifplugd/netctl) "
read selection
echo network=\'$selection\' >> ari.conf
####users and password
echo set_password=\'yes\' >> ari.conf #switch on
echo add_user=\'yes\' >> ari.conf #switch on
###root password
clear
echo "type in root password"
read root_password
###new user
clear
echo "type in your username"
read username
echo "type user password"
read user_password
echo root_password=\'$root_password\' >> ari.conf
echo username=\'$username\' >> ari.conf
echo user_password=\'$user_password\' >> ari.conf
###xorg
clear
echo xorg=\'yes\' >> ari.conf #switch on
##### desktop environment
echo "type in a desktop environment,
 possible values: (no/cinnamon/enlightenment/gnome/kde/lxde/mate/xfce4)"
read desktop_environment
echo desktop_environment=\'$desktop_environment\' >> ari.conf
##### display manager
clear
echo"type in a login manager possible values: (no/gdm/kdm/lxdm/xdm)"
read loginmanager
echo display_manager=\'$loginmanager\' >> ari.conf
##### browser
clear
echo "type in a browser, possible values: (no/firefox/midori/chromium)"
read browser
echo "type in for tor-browser possible values: (no/yes)"
read tor
echo tor_browser=\'$tor\' >> ari.conf
##### client-mail
clear
echo "client for email, choose one? possible values: (no/thunderbird/evolution/kmail/claws-mail)"
read client_mail
echo client_mail=\'$client_mail\' >> ari.conf
####final
echo edit_conf=\'yes\' >> ari.conf
echo confirm=\'yes\' >> ari.conf
echo unmount=\'yes\' >> ari.conf
########
./archinstaller.sh
