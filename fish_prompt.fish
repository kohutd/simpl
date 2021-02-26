function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l ok (set_color -o "#93A1A1")
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o "#DC322F")
  set -l blue (set_color -o blue)
  set -l green (set_color -o green)
  set -l normal (set_color normal)

  set -l cwd $ok(prompt_pwd)

  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b ok black) '[' (basename "$VIRTUAL_ENV") ']' $normal ' '
  end

  if [ (_git_branch_name) ]
    set -l git_branch '(' (_git_branch_name) ')'

    if [ (_is_git_dirty) ]
      set git_info $red $git_branch " ★ "
    else
      set git_info $green $git_branch
    end
    echo -n -s ' ' $cwd ' · ' $git_info $normal
  else
    echo -n -s ' ' $cwd $normal
  end

  echo -n -s ' › ' $normal
  echo -en '\e[5 q'
end
