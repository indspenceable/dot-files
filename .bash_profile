# my progs aww yiss
currentdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PATH="$PATH:$currentdir/bin/"

# just git things
alias gs="git status -s"
alias gap="git add -p"
alias gcb="git co -b"
alias pac="php app/console"
alias pu="vendor/bin/phpunit -c app/phpunit.xml"
alias gsd="git submodule update"
function gpr(){
    open -a "Google Chrome" "https://github.com/CrisisTextLine/app/compare/$(git symbolic-ref --short HEAD)?expand=1" --args --profile-directory="CTL"
}

# Git autocompletes
if [ -f $currentdir/.git-completion.bash ]; then
  . $currentdir/.git-completion.bash
fi

# custom prompt
source $currentdir/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
PS1="\[\e[0;35m\]\w\[\e[1;36m\]\$(__git_ps1)\[\e[0;37m\] \$ "

# color ls
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Eternal bash history.
# From: http://stackoverflow.com/questions/9457233/unlimited-bash-history
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
