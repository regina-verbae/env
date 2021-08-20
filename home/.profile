# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# alias gitssh=`perl -E 'chomp(my $remote = \`git remote\`); chomp(my $git = \`git config --get remote.$remote.url\`); $git = "git\@github.com:" . join("/", (split("/", $git))[-2..-1]); say "git remote set-url $remote $git";'`

# Defaults
alias ls='ls --color=auto'
alias less='less -R'
alias ack='ack --follow'
alias prove='prove -l'
alias perl='perl -MDDP'
alias strace='strace -s 256 -y'

# Turn on utf8 in vim/gvim
alias unigvim="gvim -c 'e ++enc=utf-8'"
alias univim="vim -c 'e ++enc=utf-8'"

# Handy manipulations
alias comma_sep="xargs | sed 's/ /,/g'"
alias comma_sep_string="xargs | sed 's/ /\",\"/g' | sed 's/^/\"/' | sed 's/$/\"/'"
alias comma_sep_hex="xargs | sed 's/ /\x27,x\x27/g' | sed 's/^/x\x27/' | sed 's/$/\x27/'"
alias one_line="xargs"

# Things I can't remember
alias dirsize='du ch --max-depth 1'
alias epoch='date +%s'
alias c='LC_ALL=c'

# ps stuff
psCols='ppid,pid,state,start,%cpu,%mem,args'
alias psall="ps axfo user,$psCols"
alias psme="ps xfo $psCols -u $USER"

function pspid () {
    if [ $# -lt 1 ]
    then
        echo "Usage: pspid <pid>";
        return 1;
    else
        ps fo user,$psCols --pid $1 --pid $1;
    fi
}

function fdpid () {
    if [ $# -lt 1 ]
    then
        echo "Usage: fdpid <pid>";
        return 1;
    else
        ls -l /proc/$1/fd;
    fi
}

# .dataprinter file location
export DATAPRINTERRC="$HOME/github/env/home/.dataprinter"

PATH="$HOME/.plenv/bin:$HOME/bin:$PATH"

# Initialize plenv
eval "$(plenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"
