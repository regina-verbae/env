alias ls='ls --color'
alias gitssh=`perl -E 'chomp(my $remote = \`git remote\`); chomp(my $git = \`git config --get remote.$remote.url\`); $git = "git\@github.com:" . join("/", (split("/", $git))[-2..-1]); say "git remote set-url $remote $git";'`
