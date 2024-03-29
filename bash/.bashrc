export EDITOR=`which vim`
export PATH=/usr/local/sbin:$HOME/.rbenv/bin:/usr/local/bin:$PATH
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# git prompt
GIT_PS1_SHOWDIRTYSTATE=true
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Solarized
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

export PS1='\[\033[0;34m\]\W$(__git_ps1 " (%s)") $\[\033[0m\] '

# aliases
alias mm='subl .'
alias curl='curl -sS'
alias script='echo "Did you mean /usr/bin/script ?"'

# bash completions
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
source $HOME/.bash_completion.d/poet.bash
complete -C $HOME/.bash_completion.d/rake -o default rake
complete -C $HOME/.bash_completion.d/ssh ssh

# If Gemfile exists, use bundle exec
function rake {
  if [ -e "Gemfile" ]; then
    bundle exec rake $@
  else
    `which rake` $@
  fi
}
function foreman {
  if [ -e "Gemfile" ]; then
    bundle exec foreman $@
  else
    `which foreman` $@
  fi
}

# rbenv-specific
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source /Users/andrewendt/.docker/init-bash.sh || true # Added by Docker Desktop
