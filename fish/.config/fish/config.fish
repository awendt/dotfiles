set PATH $HOME/.rbenv/shims $PATH

alias unset 'set --erase'

status --is-interactive; and source (rbenv init -|psub)
