PROMPT='%{$fg_bold[cyan]%}$(get_pwd)%{$reset_color%} $(git_prompt_info)
${prompt_suffix}'

local prompt_suffix="🐋 "

BRANCH="⎇"

# by shashankmehta (https://github.com/shashankmehta)
function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg_bold[green]%}$BRANCH "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}[*]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
