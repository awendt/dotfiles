set PATH $HOME/.rbenv/shims $HOME/.bin $PATH

alias unset 'set --erase'

status --is-interactive; and source (rbenv init -|psub)

set -gx LANG en_US.UTF-8
set -g fish_user_paths "/usr/local/opt/node@10/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths

set -gx OPENSSL_DIR (brew --prefix openssl@1.1)
set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=$OPENSSL_DIR"
