#!/bin/bash

# Check if Homebrew is installed, and install it if not
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Update Homebrew and upgrade existing packages
echo "Updating Homebrew..."
brew update
brew upgrade

# Install Git
echo "Installing Git..."
brew install git

# Install Java (latest version)
echo "Installing Java..."
brew install openjdk
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# Install Maven
echo "Installing Maven..."
brew install maven

# Install Slack
echo "Installing Slack..."
brew install --cask slack

# Install Teams
echo "Installing Teams..."
brew install --cask microsoft-teams

# Install Google Chrome
echo "Installing Google Chrome..."
brew install --cask google-chrome

# Install Zoom
echo "Installing Zoom..."
brew install --cask zoom

# Clean up Homebrew
echo "Cleaning up..."
brew cleanup

echo "All software installed successfully!"
