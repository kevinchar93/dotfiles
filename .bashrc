# Read proxies file
source ~/.proxies

# Interactive operation...
alias rm='rm -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'
alias f='find . -name'
alias du='du -h . -d 1'

alias gd='git difftool'
alias gm='git mergetool'
alias gs='git status'
alias gpl='git pull'
alias gplom='git pull origin master'
alias gp='git push'
alias ga='git add'
alias gau='git add -u :/'
alias gdf='git diff --color=always'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gl='git log'
alias gme='git merge'
alias gsb='git submodule update --init'
alias gdn='git diff --name-only'
alias gdnm='git diff --name-only master'



function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "[${BRANCH}]"
	else
		echo ""
	fi
}

export PS1="\[\e[31m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[33m\]:\[\e[m\]\[\e[33m\]\w\[\e[m\] \[\e[44m\]\`parse_git_branch\`\[\e[m\]  [\[\e[37;40m\]\t\[\e[m\]] \n\\$ "
