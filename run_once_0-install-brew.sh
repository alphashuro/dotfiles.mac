#!/bin/bash
echo "installing brew..."
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Brewfile hash: {{ include "Brewfile" | sha256sum }}

echo "running brew bundle install..."
NONINTERACTIVE=1 brew bundle install --file ~/Brewfile
echo "running brew bundle install DONE."

echo "starting goku service..."
NONINTERACTIVE=1 brew services start goku
echo "starting goku service DONE."

echo "installing brew DONE."
