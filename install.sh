#!/bin/bash

set -eufo pipefail

echo ""
echo "🤚  This script will setup .dotfiles for you."
read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'


# Install Homebrew
command -v brew >/dev/null 2>&1 || \
  (echo '🍺  Installing Homebrew' && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

# Install Oh My Zsh
if [ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
  (echo '💰  Installing oh-my-zsh' && yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")
fi

# Install chezmoi
command -v chezmoi >/dev/null 2>&1 || \
  (echo '👊  Installing chezmoi' && brew install chezmoi)

if [ -d "$HOME/.local/share/chezmoi/.git" ]; then
  echo "🚸  chezmoi already initialized"
  echo "    Reinitialize with: 'chezmoi init https://github.com/siggerzz/dotfiles.git'"
else
  echo "🚀  Initialize dotfiles with:"
  echo "    chezmoi init https://github.com/siggerzz/dotfiles.git"
fi

# Ask the user if they want to install packages from the Brewfile
read -p "Do you want to install packages from the Brewfile? (y/n) " -n 1 -r
echo    # Move to a new line

if [[ $REPLY =~ ^[Yy]$ ]]
then
    # User wants to install packages, execute the brew bundle command
    echo '👊 Installing Homebrew packages. This may take a few minutes...'
    brew bundle
else
    # User chose not to install packages
    echo "Skipping Homebrew package installation."
fi

echo "Checking Bitwarden login status..."

# Check Bitwarden login status
BW_STATUS=$(bw status | jq -r '.status')

# Determine the login status and act accordingly
if [ "$BW_STATUS" != "unauthenticated" ]; then
    echo "You are already logged into Bitwarden. Current status: $BW_STATUS"
else
    echo "You are not logged into Bitwarden. Please login to proceed."
    echo "Login with Bitwarden CLI:"
    read -p "Your Bitwarden email: " BW_EMAIL
    read -s -p "Your Bitwarden master password: " BW_PASSWORD
    echo
    bw login "$BW_EMAIL" "$BW_PASSWORD"
fi


echo "Done."