#!/bin/bash
echo "installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Brewfile hash: {{ include "Brewfile" | sha256sum }}

echo "running brew bundle install..."
brew bundle install
echo "running brew bundle install DONE."

echo "starting goku service..."
brew services start goku
echo "starting goku service DONE."

echo "installing brew DONE."
