#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias dotdrop='$HOME/.local/dotfiles/dotdrop.sh --cfg=$HOME/.local/dotfiles/config.yaml'
alias grep='grep --color=auto'
alias ls='ls -lah --color=always --group-directories-first'
alias yay='yay --color=always'

PS1='\n\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]$\[\033[00m\] '

export PATH=$HOME/.local/bin:$HOME/.qlot/bin:$PATH

export BROWSER=wslview
export EDITOR=nvim
export GNUPGHOME=$HOME/.gnupg
export GPG_TTY="${TTY:-"$(tty)"}"
export VISUAL=nvim

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
gpg-connect-agent updatestartuptty /bye >/dev/null

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
. "$HOME/.local/dotfiles/dotdrop/completion/dotdrop-completion.bash"
