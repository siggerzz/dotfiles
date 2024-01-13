#!/bin/bash

set -eufo pipefail

echo ""
echo "🤚  This script will setup .dotfiles for you."
read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'


# Install Homebrew
command -v brew >/dev/null 2>&1 || \
  (echo '🍺  Installing Homebrew' && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

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
    brew bundle --file=~/.brew/Brewfile
else
    # User chose not to install packages
    echo "Skipping Homebrew package installation."
fi

echo "All Done!"
