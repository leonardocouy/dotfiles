export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/10/bin:$PATH"

[[ -s ~/.bashrc ]] && source ~/.bashrc

source $HOME/.bash_prompt
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

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

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if which direnv &> /dev/null; then
  eval "$(direnv hook bash)"
fi

