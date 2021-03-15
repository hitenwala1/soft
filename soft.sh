#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://repo.skype.com/latest/skypeforlinux-64.deb
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo dpkg -i *.deb
sudo apt-get install -f -y
sudo apt-get install git maven openjdk-8-jdk -y
sudo snap install zoom-client
#sudo snap install slack --classic
