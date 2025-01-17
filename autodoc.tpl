## Time
/usr/bin/date --iso-8601=seconds
/usr/bin/timedatectl
/usr/bin/chronyc sources

## Host Identity
/etc/hostname
/usr/bin/hostname
/usr/bin/hostname -s
/usr/bin/hostname -f
/usr/bin/hostname -A
/etc/hostid
/etc/machine-id
/usr/bin/sudo /usr/bin/cat /var/lib/dbus/machine-id
/proc/sys/kernel/random/boot_id

## Hardware And System Components
/usr/bin/lspci
/usr/bin/lsusb
/usr/bin/sudo /usr/bin/lshw -quiet -numeric -notime
/usr/bin/sudo /usr/bin/lsinput
/usr/bin/lsblk
/usr/bin/lscpu
/usr/bin/lsgpu
/usr/bin/lsmem
/usr/bin/lspower
/usr/bin/sudo /usr/sbin/dmidecode
/proc/cpuinfo
/proc/meminfo

## Users
/usr/bin/who
/usr/bin/last
/usr/bin/faillog -a
/etc/passwd
/etc/group
/etc/subuid
/etc/subgid

## SSH
/etc/ssh/sshd.conf
/etc/ssh/ssh_host_dsa_key.pub
/etc/ssh/ssh_host_rsa_key.pub
/etc/ssh/ssh_host_ecdsa_key.pub
/etc/ssh/ssh_host_ed25519_key.pub
/root/.ssh/authorized_keys

## Packages And Software
# RPM
/usr/bin/rpm -qa --last
/usr/bin/sudo /usr/sbin/needs-restarting -r
# DEB (Debian/Ubuntu)
#/usr/bin/apt list
/usr/bin/sudo /usr/bin/apt-get upgrade -s
/usr/bin/dpkg -l
/usr/bin/tail -25 /var/log/dpkg.log
/var/lib/apt/periodic/update-success-stamp
/var/run/reboot-required
/var/run/reboot-required.pkgs
# Snap
/usr/bin/snap list
/usr/bin/sudo /usr/bin/snap refresh --list
# YUM Sources
#/usr/bin/yum grouplist
/usr/bin/yum repolist
# APT Sources
/etc/apt/sources.list
/etc/apt/sources.list.d/

## Kernel
/usr/bin/uname -a
/usr/sbin/lsmod
/proc/cmdline
/usr/bin/uptime

## Operating System Version
/etc/os-release
/etc/lsb-release
/etc/redhat-release
/etc/oracle-release
/etc/centos-release
/etc/suse-release

## OS Installation Configuration
/usr/bin/sudo cat /root/anaconda-ks.cfg
/usr/bin/sudo cat /root/initial-setup-ks.cfg
/usr/bin/sudo cat /root/original-ks.cfg

## System Services
/usr/bin/systemctl list-unit-files

## Disks And Partitioning
/usr/bin/sudo /usr/sbin/parted -l
/usr/bin/df
/usr/bin/df -i
/usr/bin/mount
/proc/mounts

## Network And Connections
/usr/sbin/ip a l
/usr/sbin/ip r l
/usr/sbin/route
/usr/bin/netstat -atn
/usr/bin/lsof -i tcp -s tcp:listen -P -n
/usr/bin/sudo /usr/sbin/iptables -L -vn
/usr/bin/sudo /usr/sbin/ebtables -L
/usr/bin/sudo /usr/sbin/nft list ruleset
/usr/bin/sudo /usr/bin/firewall-cmd --list-all-zones
/etc/hosts
/etc/resolv.conf
/etc/nsswitch.conf
/etc/network/interfaces
/etc/network/interfaces.d/

## Cron And Timers
/etc/crontab
/etc/cron.d/
/etc/cron.hourly/
/etc/cron.daily/
/etc/cron.weekly/
/etc/cron.monthly/
/usr/bin/systemctl list-timers --all

## Virtualization
/usr/bin/sudo /usr/sbin/virt-what
/usr/bin/podman ps
/usr/bin/docker ps
/usr/bin/docker ps -a
/usr/bin/docker image list
/usr/bin/docker network list
/usr/bin/virsh list --all

## Misc
/usr/bin/facter
/usr/bin/bluetoothctl devices
/etc/motd
/etc/issue
/etc/issue.net
/etc/nologin
/boot/grub/grub.cfg
/etc/rsnapshot.conf
