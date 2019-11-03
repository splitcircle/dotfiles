export PATH=$PATH:/Users/ccallan/.npm-global/bin
 #If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH=$HOME/go
PATH=$GOPATH/bin:$PATH

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

PROMPT='🐡'
RPROMPT='🌸'

#sourcing plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
