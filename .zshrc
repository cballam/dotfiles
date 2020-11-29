# Created by newuser for 5.8
emulate -R ksh -c 'source ~/.bashrc'

fpath+=$HOME/.zsh/pure

setopt INC_APPEND_HISTORY

##(cat ~/.config/wpg/sequences &)
autoload -U promptinit; promptinit
prompt pure

