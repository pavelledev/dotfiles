PROMPT="%F{8}┌─╼[%F{4}%n%f@%F{4}%m%F{8}]"
PROMPT+='╾╼[%F{4}%c%F{8}]$(git_prompt_info)%F{8}
└▶%f '

ZSH_THEME_GIT_PROMPT_PREFIX="╾╼[%F{4}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%F{8}]╾╼[%{$fg[yellow]%}✗%F{8}]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})%F{8}]"
