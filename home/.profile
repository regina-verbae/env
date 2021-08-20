# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# alias gitssh=`perl -E 'chomp(my $remote = \`git remote\`); chomp(my $git = \`git config --get remote.$remote.url\`); $git = "git\@github.com:" . join("/", (split("/", $git))[-2..-1]); say "git remote set-url $remote $git";'`

alias ls='ls --color=auto'

# .dataprinter file location
export DATAPRINTERRC="$HOME/github/env/home/.dataprinter"

PATH="$HOME/.plenv/bin:$HOME/bin:$PATH"

# Initialize plenv
eval "$(plenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"
