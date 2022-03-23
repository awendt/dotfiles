set PATH $HOME/.rbenv/shims $HOME/.bin $PATH

alias unset 'set --erase'
alias cat='bat --theme="Solarized (light)"'

status --is-interactive; and source (rbenv init -|psub)

set -gx LANG en_US.UTF-8
set -g fish_user_paths "/usr/local/opt/node@14/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths

# specific to Ruby
set -gx OPENSSL_DIR (brew --prefix openssl@1.1)
set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=$OPENSSL_DIR"
set -gx GEMRC $HOME/.gemrc.local

ulimit -n 1024
