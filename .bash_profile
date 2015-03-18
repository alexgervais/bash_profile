# Prompt

export EDITOR=/usr/bin/nano
export BLOCKSIZE=1k

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Commands

alias ll='ls -FlAahp'

alias cd..='cd ../'
alias ..='cd ../'

alias edit='atom'

alias finder='open -a Finder ./'

alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

alias ttop="top -R -F -s 10 -o rsize"

alias whatismyip='curl ip.appspot.com'

alias sockets='lsof -i'

alias ports='sudo lsof -i | grep LISTEN'

alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"

alias ducks='du -cks * | sort -rn | head'

extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

killport() {
    lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9
}

ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}