#!/bin/bash

echo "installing doom-nvim."

echo "cloning..."
git clone --depth 1 https://github.com/NTBBloodbath/doom-nvim.git ${XDG_CONFIG_HOME:-$HOME/.config}/nvim
echo "cloning DONE."

echo "installing packages..."
nvim --headless '+PackerInstall' '+PackerClean!' '+PackerUpdate' '+qall'
echo "installing packages DONE."

echo "installing doom-nvim DONE."
