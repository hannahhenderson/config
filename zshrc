# When you make updates to this file, load them by running:
# . ~/.zshrc
alias refresh='. ~/.zshrc'

# If you come from bash you might have to change your $PATH.
path+=("$HOME/bin")
export PATH
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Path to your oh-my-zsh installation.
export ZSH=/Users/hannah/.oh-my-zsh

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
# Git add without any of the whitespace changes
alias git-add-no-whitespace='git diff -w --no-color | git apply --cached --ignore-whitespace && git checkout -- . && git reset && git add -p'
alias git-master='git pull --rebase origin master'

# -------------------------------------------------------------------
# SSH
# -------------------------------------------------------------------

# -------------------------------------------------------------------
# An’s Wizardry
# -------------------------------------------------------------------
# Copy diff to clipboard then use this function
# git diff | pbcopy
# Diff will be applied to code
diffapply() {
        pbpaste > file
        patch -p1 < file
        rm file
}
## Push the current diff to the copy buffer
alias diffcopy="git diff | pbcopy"

# -------------------------------------------------------------------
# DOCKER
# -------------------------------------------------------------------
alias docker-stop-all-containers='docker stop $(docker ps -a -q)'
alias docker-remove-all-containers='docker rm $(docker ps -a -q)'
alias docker-remove-all-images='docker rmi $(docker images -q)'
alias docker-remove-dangling='docker volume rm $(docker volume ls -qf dangling=true)'

# This is the nuclear option. Clears everything (I hope.)
alias docker-clear-all="docker ps -a | sed '1 d' | awk '{print $1}' | xargs -L1 docker rm docker images -a | sed '1 d' | awk '{print $3}' | xargs -L1 docker rmi -f"

# -------------------------------------------------------------------
# Robby Russell’s config
# -------------------------------------------------------------------
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Remove forward-char widgets from ACCEPT
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")

# Add forward-char widgets to PARTIAL_ACCEPT
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/openldap/bin:$PATH"
export PATH="/usr/local/opt/openldap/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
