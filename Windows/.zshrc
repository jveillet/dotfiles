# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

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
plugins+=(zsh-completions git git-extras github ruby thor rake sudo tmux npm node heroku gem)
autoload -U compinit && compinit
# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=en_US.UTF-8
export EDITOR=vim
export PYTHONPATH=/usr/lib/python2.7/site-packages
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval $("docker-machine" env default --shell=zsh)
source $HOME/.babun-docker/setup.sh

# Docker dev environment
alias docdev="docker-compose -f development.yml"

# Aliases to interact with docker macine
alias machine-start="docker-machine start default"
alias machine-stop="docker-machine stop default"

# Alias for ruby
#alias ruby='/cygdrive/c/Ruby22-x64/bin/ruby'
#alias gem='/cygdrive/c/Ruby22-x64/bin/gem.bat'
#alias rubocop='/cygdrive/c/Ruby22-x64/bin/rubocop.bat'
#alias reek='/cygdrive/c/Ruby22-x64/bin/reek.bat'

#
zstyle ':completion::complete:grunt::options:' show_grunt_path yes
zstyle ':completion:*' use-cache yes

# Note: ~/.ssh/environment should not be used, as it
# already has a different purpose in SSH.
env=~/.ssh/agent.env

# Note: Don't bother checking SSH_AGENT_PID. It's not used
# by SSH itself, and it might even be incorrect
# (for example, when using agent-forwarding over SSH).
agent_is_running() {
  if [ "$SSH_AUTH_SOCK" ]; then
    # ssh-add returns:
    # 0 = agent running, has keys
    # 1 = agent running, no keys
    # 2 = agent not running
    ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
  else
    false
  fi
}

agent_has_keys() {
  ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
  . "$env" >/dev/null
}

agent_start() {
  (umask 077; ssh-agent >"$env")
  . "$env" >/dev/null
}

if ! agent_is_running; then
  agent_load_env
fi

unset env

