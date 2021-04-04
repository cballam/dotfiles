# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias vim=nvim
alias vi=nvim
alias v=nvim

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

write() {
	#!/bin/bash
	cd ~/Documents/masters/research_proposal
	zathura *.pdf &
	sleep 0.2
	bspc node any.floating -t tiled
	nvim -S
	bspc node -c
}

annotate() {
	PAD_SETUP="UGTABLET 10 inch PenTablet Pen (0)"
	PAD_EXISTS=$(xinput | grep "$PAD_SETUP")
	if [[ -z $PAD_EXISTS ]]; then
		notify-send "No tablet!"
	else
		exec ~/scripts/tablet_setup &
	fi
	xournalpp &
	notify-send "Taking notes"	
}

paper() {
	PAPER=$(cd ~/Documents/masters/DB/ && fzf)
	if [[ -n $PAPER ]]; then
		zathura ~/Documents/masters/DB/"$PAPER" & disown
	fi
}

alias rgf="rg -l"
