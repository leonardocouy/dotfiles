[[ -s ~/.bashrc ]] && source ~/.bashrc

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## Sourcing presets

presets=$(find $HOME/.presets -name '*' -not -name '*.local' -type f -follow -print)
for f in $presets; do source $f; done

if which direnv &> /dev/null; then
  eval "$(direnv hook bash)"
fi

