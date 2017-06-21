#!/bin/bash
## Usage: bash nvidia_cuda.sh
## Author: sumanth
## Purpose: setups the system for ihmc controllers
##
## Options:
##   none
##

echo "$(tput setaf 1)WARNING..!!!!\ndowload the cuda drivers into downloads$(tput sgr0)"
sudo apt-get install build-essential
echo "$(tput setaf 1)black list nouveau$(tput sgr0)"
sudo -su
touch /etc/modprobe.d/blacklist-nouveau.conf
echo "
blacklist nouveau
options nouveau modeset=0
" >> blacklist-nouveau.conf
exit

echo "$(tput setaf 1)initialise ram file system$(tput sgr0)"
sudo update-initramfs -u

echo "$(tput setaf 1)rebooting......$(tput sgr0)"
sudo reboot

