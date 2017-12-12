function fish_right_prompt
  set -l ok (set_color -o "#93A1A1")
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l red (set_color -o "#DC322F")
  set -l normal (set_color normal)

  if test $last_status -ne 0
    echo -n -s $red (prompt_pwd) ' '
  else
    echo -n -s $cyan (prompt_pwd) ' '
  end
end
