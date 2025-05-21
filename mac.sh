#!/bin/bash

# Check if Homebrew is installed, and install it if not
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add Homebrew to PATH for this script's runtime
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew is already installed."
fi

# Ensure brew is in PATH if installed
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
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
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

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
