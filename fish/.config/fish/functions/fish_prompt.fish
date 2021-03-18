set __fish_git_prompt_showcolorhints yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_show_informative_status yes

function last_status_prompt
  if [ $argv -ne 0 ]
    set_color red
    printf "✘"
  else
    set_color green
    printf "✔"
  end
  set_color normal
end

function fish_prompt
  # $status gets nuked as soon as something else is run, e.g. set_color
  # so it has to be saved asap.
  set -l last_status $status

  if [ "$ITERM_PROFILE" = "terrabits" ]
    printf '%s%s $ ' (last_status_prompt $last_status) (__fish_git_prompt)
  else
    printf '%s %s%s' (last_status_prompt $last_status) (prompt_pwd) (__fish_git_prompt)
    echo
    printf '%s $ ' (date +%H:%M)
  end
end
