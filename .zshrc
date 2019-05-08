export PATH=$PATH:/Users/ccallan/.npm-global/bin
 #If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH=$HOME/go
PATH=$GOPATH/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ccallan/.oh-my-zsh"
source "/src/github.com/sachaos/todoist/todoist_functions.sh"
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

alias v=nvim

# up
  function up_widget() {
    BUFFER="cd .."
    zle accept-line
  }
  zle -N up_widget
  bindkey "^k" up_widget

# home
  function goto_home() { 
    BUFFER="cd ~/"$BUFFER
    zle end-of-line
    zle accept-line
  }
  zle -N goto_home
  bindkey "^h" goto_home

# clear
  function clear_out() {
    BUFFER="clear"
    zle end-of-line
    zle accept-line
  }
  zle -N clear_out
  bindkey "^c" clear_out

# make and cd
  function md() {
    mkdir -p $1
    cd $1
  }

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  wd git zsh-autosuggestions zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship

