#!/bin/bash

sudo apt-get update -y
sudo apt-get install wget
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list

sudo apt-get update -y
sudo apt-get install anydesk -y
sudo apt-get install gnome-session-flashback -y

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://repo.skype.com/latest/skypeforlinux-64.deb
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo dpkg -i *.deb
sudo apt-get install -f -y
sudo apt-get install git maven openjdk-8-jdk -y
sudo snap install zoom-client
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install openssh-server openssh-client -y

#sudo snap install slack --classic
