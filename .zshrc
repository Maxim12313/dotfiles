export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="geoffgarside"
plugins=(zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
PATH="$PATH:/opt/nvim-linux-x86_64/bin"
PATH="$PATH:$HOME/myscripts"
PATH="$PATH:/home/maximk/.cargo/bin"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# is container file
# sudo chcon -Rt container_file_t .

# reset container file
# sudo restorecon -Rv ~/project

# other remapping
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME/"
alias pbcopy="xclip -sel clip"
alias df="duf"
alias ls="eza --icons"
alias open="xdg-open"
tree() {
    local depth=${1:-1}
    eza --icons -TL "$depth"
}
eval "$(zoxide init --cmd cd zsh)"
alias nb="ninja"

# git stuff
alias gaa="git add -A"
alias gap="git add -p"
alias gsw="git switch"
alias gc="git commit --verbose"
alias gca="git commit --amend"
alias gp="git push"
alias gpu="git push -u origin main"
alias gl="git pull"
alias gck="git checkout"
alias gst="git status"
alias glgg="git log --graph"
alias gr="git remote"
alias gd="git diff"
alias gb="git branch"
alias gsh="git show"
alias grh="git reset"
alias grs="git restore"

# cpp
alias cmakel="cmake -B build"
alias nbl="ninja -C build"
alias makel="make -C build"
alias tl="ctest --test-dir build"

bindkey "^[[Z" autosuggest-accept


co() {
    g++ -std=c++23 -g -O0 $1.cpp -o $1.out -Wall -Wextra -Wshadow -Wconversion -Wno-sign-conversion -Wno-sign-compare -Wfloat-equal -fsanitize=undefined;
}

run() {
    co $1 && ./$1.out;
}

in() {
    local number="${2:-0}"
    run $1 < "$1_input$number.txt";
    echo "----\n";
    cat "$1_output$number.txt";
}



# variables below
export EDITOR=nvim
export CMAKE_GENERATOR=Ninja


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

fpath+=${ZDOTDIR:-~}/.zsh_functions
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

