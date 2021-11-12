#! /bin/bash
export DEBIAN_FRONTEND=noninteractive
echo "PonyUp script. Copyright 2021 CanterLogic Inc."
echo
echo "Updating package list..."
apt-get update
echo
echo "Upgrading packages if any..."
apt-get -y upgrade
echo
echo "Removing unused packages if any..."
apt-get -y autoremove
needrestart -r a
if [ -f /var/run/reboot-required ]; then
  echo 'Hey please head over to VPS dashboard and click restart'
fi
