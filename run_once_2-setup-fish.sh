#!/usr/local/bin/fish

echo "setting up fish..."
# default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# vi keys
fish_vi_key_bindings
set -U fish_greeting
echo "setting up fish DONE."
