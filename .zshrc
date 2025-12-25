export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="geoffgarside"
plugins=(zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
PATH="$PATH:/opt/nvim-linux-x86_64/bin"
PATH="$PATH:$HOME/myscripts"
PATH="$PATH:/home/maximk/.cargo/bin"
PATH="$PATH:$HOME/tools"

# add john tools
PATH="$PATH:/home/maximk/builds/john/run"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# ******** networking
#
# make xterm larger
export XTERM="xterm -fa 'Monospace' -fs 16"

function mnbash() {
    if [ $# -ne 1 ]; then
        echo "Usage: $0 <hostname>"
        exit 1
    fi

    local host_process=$(ps aux | grep "mininet:$1" | grep -v grep)
    if [ -z "$host_process" ]; then
        echo "No mininet process found for $1"
        exit 1
    fi

    local host_pid=$(echo $host_process | awk '{print $2}')
    sudo mnexec -a $host_pid bash
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
alias e="nvim ."

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
alias gr="git remote"
alias gd="git diff"
alias gb="git branch"
alias gsh="git show"
alias grh="git reset"
alias grs="git restore --staged"
alias gsta="git stash save"
alias gstp="git stash pop"
alias gf="git fetch"
alias gm="git merge"
alias grb="git rebase"
alias gcp="git cherry-pick"
alias gai="git add -i"
alias gr="git remote"
alias glgg="git log --graph"
alias glg="git log -n5"

# github
alias ghr="gh repo view --web"
alias ghl="gh pr list --web"

# cpp
alias cmakel="cmake -B build"
alias nbl="ninja -C build"
alias makel="make -C build"
alias tl="ctest --test-dir build"
alias make="make -j8"

# python
alias py="python"

# rust
alias c="cargo"

bindkey "^[[Z" autosuggest-accept

# hacks
alias john="~/builds/john/run/john"
function cont() {
    touch z_expected.txt
    cp ~/cpp/template/Makefile .
}

alias diff="diff -yb"


# variables below
export EDITOR=nvim
export CMAKE_GENERATOR=Ninja


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

fpath+=${ZDOTDIR:-~}/.zsh_functions
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PATH=$PATH:/home/maximk/builds/john/
