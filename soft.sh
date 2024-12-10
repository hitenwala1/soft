#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating package list..."
sudo apt-get update -y

echo "Installing wget..."
sudo apt-get install -y wget

# Adding AnyDesk repository key and repository
echo "Adding AnyDesk repository..."
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list

echo "Updating package list after adding AnyDesk repo..."
sudo apt-get update -y

echo "Installing AnyDesk..."
sudo apt-get install -y anydesk

echo "Installing GNOME Flashback session..."
sudo apt-get install -y gnome-session-flashback

# Download and install Google Chrome
echo "Downloading and installing Google Chrome..."
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb
sudo dpkg -i google-chrome.deb || sudo apt-get install -f -y
rm -f google-chrome.deb

# Install development tools
echo "Installing Git, Maven, and OpenJDK 8..."
sudo apt-get install -y git maven openjdk-8-jdk

# Install Zoom client via Snap
echo "Installing Zoom client..."
sudo snap install zoom-client

# Install Skype via Snap
echo "Installing Skype..."
sudo snap install skype

# Install Slack via Snap (classic confinement)
echo "Installing Slack..."
sudo snap install slack --classic

# Update and upgrade all packages
echo "Performing final system update and upgrade..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install OpenSSH server and client
echo "Installing OpenSSH server and client..."
sudo apt-get install -y openssh-server openssh-client

# Uncomment 'WaylandEnable=false' in custom.conf
echo "Uncommenting 'WaylandEnable=false' in /etc/gdm3/custom.conf..."
sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=false/' /etc/gdm3/custom.conf
echo "'WaylandEnable=false' has been uncommented."

echo "Installation complete!"
