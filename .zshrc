export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="geoffgarside"
plugins=(zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

export EDITOR=vim
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
PATH="$PATH:/opt/nvim-linux-x86_64/bin"
PATH="$PATH:$HOME/myscripts"

alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME/"
alias pbcopy="xclip -sel clip"

alias gaa="git add -A"
alias gap="git add -p"
alias gc="git commit --verbose"
alias gca="git commit --amend"
alias gp="git push"
alias gl="git pull"
alias gck="git checkout"
alias gst="git status"
alias glgg="git log --graph"
alias grh="git reset"
alias gra="git remote add"
alias grs="git remote set-url"

bindkey "^[[Z" autosuggest-accept


coDebug() {
    g++ -std=c++23 -g -O1 $1.cpp -o $1.out -Wall -Wextra -Wshadow -Wconversion -Wno-sign-conversion -Wno-sign-compare -Wfloat-equal -fsanitize=address,undefined;
}
coFast() {
    g++ -std=c++23 -O0 $1.cpp -o $1.out -Wall -Wshadow -Wconversion -Wno-sign-conversion -Wno-sign-compare -Wfloat-equal -fsanitize=undefined;
}

run() {
    coFast $1 && ./$1.out;
}

inf() {
    number="${2:-0}";
    coFast $1 && ./$1< "$1_input$number.txt";
    echo "----\n";
    cat "$1_output$number.txt";
}

ind() {
    number="${2:-0}"
    run $1 < "$1_input$number.txt";
    echo "----\n";
    cat "$1_output$number.txt";
}


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

fpath+=${ZDOTDIR:-~}/.zsh_functions
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
