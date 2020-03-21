export PATH=$PATH:/Users/ccallan/.npm-global/bin
 #If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH=$HOME/go
PATH=$GOPATH/bin:$PATH

eval "$(rbenv init -)"

alias v=nvim
alias doom=~/.emacs.d/bin/doom

setopt PROMPT_SUBST

# up
  function up_widget() {
    BUFFER="cd .."
    zle accept-line
  }
  zle -N up_widget
  bindkey "^a" up_widget

# home
  function goto_home() { 
    BUFFER="cd ~/"$BUFFER
    zle end-of-line
    zle accept-line
  }
  zle -N goto_home
  bindkey "^o" goto_home

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
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

#custom prompt
git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "%F{183}$BRANCH"

    if [ ! -z "$(git status --short)" ]; then
      echo " %F{160}✗"
    fi
  fi
}

PROMPT='
‎%U%F{216}%T %F{183}/%c‎%u
%F{183}𝝺 '

RPROMPT='$(git_prompt)'

#sourcing plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
