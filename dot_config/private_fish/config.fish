if status is-interactive
    set -x EDITOR hx
    set -U fish_greeting

    starship init fish | source

    # why was this here again?
    # something to do with rust and lld :thinking:
    set LIBRARY_PATH $LIBRARY_PATH (brew --prefix)/lib (brew --prefix)/opt/libiconv/lib

    thefuck --alias | source
    zoxide init --cmd cd fish | source
    
    alias cat=bat
    alias ls=lsd
end

alias vimdiff='nvim -d'
alias k='kubectl'

# pnpm
set -gx PNPM_HOME "/Users/alpha/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

source /Users/alpha/.config/op/plugins.sh

fish_add_path /Users/alpha/.cargo/bin

# set -x DOCKER_HOST 'unix:///Users/alpha/.local/share/containers/podman/machine/qemu/podman.sock'

# tailscale cli
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
