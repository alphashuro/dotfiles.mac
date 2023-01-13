if status is-interactive
    set -x EDITOR hx
    set -U fish_greeting

    starship init fish | source

    # why was this here again?
    # something to do with rust and lld :thinking:
    set LIBRARY_PATH $LIBRARY_PATH (brew --prefix)/lib (brew --prefix)/opt/libiconv/lib

    thefuck --alias | source
    zoxide init --cmd j fish | source
end

alias vimdiff='nvim -d'
