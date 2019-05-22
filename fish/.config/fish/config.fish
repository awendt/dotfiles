set PATH $HOME/.rbenv/shims $PATH

alias unset 'set --erase'

status --is-interactive; and source (rbenv init -|psub)

set -gx LANG en_US.UTF-8
set -g fish_user_paths "/usr/local/opt/node@10/bin" $fish_user_paths
