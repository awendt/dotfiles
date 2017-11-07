set __fish_git_prompt_showcolorhints yes
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_show_informative_status yes

function fish_prompt
  # $status gets nuked as soon as something else is run, e.g. set_color
  # so it has to be saved asap.
  set -l last_status $status
  if [ $last_status -ne 0 ]
    set_color red
    echo -n "✘-$last_status "
  else
    set_color green
    echo -n "✔ "
  end
  set_color normal

  printf '%s%s' (prompt_pwd) (__fish_git_prompt)
  echo
  printf '%s $ ' (date +%H:%M)
end
