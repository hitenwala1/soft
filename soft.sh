#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Updating package list..."
sudo apt-get update -y

echo "Installing wget..."
sudo apt-get install -y wget

echo "Installing VIM..."
sudo apt-get install -y vim

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

# Install Teams via Snap
echo "Installing TEAMS..."
sudo snap install teams-for-linux

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

# Enrolling client in FleetDM

FILE_ID="1KqstDdgv9_NDKWUQaN4YufofU9UCZ_KT"
FILE_NAME="fleetctl"

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&id=${FILE_ID}&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id='"${FILE_ID}" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p')" -O "${FILE_NAME}" && rm -rf /tmp/cookies.txt

sudo cp fleetctl /usr/local/bin/fleetctl
sudo chmod a+x /usr/local/bin/fleetctl

sudo mkdir -p /etc/osquery/certs

sudo cp fleet.crt /etc/osquery/certs/fleet.crt

fleetctl package \
  --type=deb \
  --enable-scripts \
  --fleet-desktop \
  --fleet-url=https://inventory.freestoneinfotech.com:5543 \
  --enroll-secret=7bep9008c/0D//8Hf/mmvDQr967RBalh \
  --insecure

sudo dpkg -i fleet-osquery_*.deb
sudo systemctl start orbit
sudo systemctl enable orbit

echo "Installing Anydesk "
wget https://download.anydesk.com/rpi/anydesk-7.0.2-arm64.tar.gz
sudo dpkg -i anydesk_*.deb
 
echo "Installation complete!"
