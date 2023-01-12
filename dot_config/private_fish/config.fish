if status is-interactive
    set -x EDITOR hx
    set -U fish_greeting

    starship init fish | source

    set LIBRARY_PATH $LIBRARY_PATH (brew --prefix)/lib (brew --prefix)/opt/libiconv/lib
end

thefuck --alias | source
zoxide init --cmd j fish | source
