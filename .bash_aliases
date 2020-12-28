# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias vim=nvim
alias vi=nvim

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias python='python3'

alias tags='ctags -R --exclude=.git --exclude=node_modules --exclude=*.json'

export BAT_THEME='ansi-dark'

# quick edit. escapes spaces properly in file path
e() {
				FILE=$(fzf)
				if [ -n "$FILE" ]; then
					vim $PWD/$FILE
				else
					echo "No file chosen"
				fi
}

