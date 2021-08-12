fish_vi_key_bindings
alias v='nvim'
alias doom='~/.emacs.d/bin/doom'
alias pfetch='sh ~/dev/etc/pfetch/pfetch'
alias moon='curl wttr.in/moon'
alias weather='curl wttr.in/philadelphia'
alias work='cd ~/dev/wwd/be'
alias angora='$HOME/.virtualenv/angora/bin/angora'
set -g fish_user_paths "/usr/local/Cellar/ruby/3.0.0_1/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/lib/ruby/gems/3.0.0/bin" $fish_user_paths
set -x WBDL_HOME "$HOME/dev/wbdl"
set -x DFHOME "$HOME/dev/wbdl"
status --is-interactive; and source (rbenv init -|psub)

starship init fish | source
