set PATH /opt/homebrew/bin /opt/homebrew/sbin $HOME/.rbenv/shims $HOME/.bin $PATH
set INFOPATH /opt/homebrew/share/info $INFOPATH
set HOMEBREW_PREFIX /opt/homebrew
set HOMEBREW_CELLAR /opt/homebrew/Cellar

alias unset 'set --erase'
alias cat='bat --theme="Solarized (light)"'
alias sd='~/dotfiles/scripts/bin/sd'

status --is-interactive; and source (rbenv init -|psub)

set -gx LANG en_US.UTF-8
set -g fish_user_paths "/usr/local/opt/node@14/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths

# specific to Ruby
set -gx OPENSSL_DIR (brew --prefix openssl)
set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=$OPENSSL_DIR"
set -gx GEMRC $HOME/.gemrc.local

ulimit -n 1024
