export PATH="$HOME/bin:$PATH"

source $HOME/.bash_prompt
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

## Sourcing presets

presets=$(find $HOME/.presets -name '*' -not -name '*.local' -type f -follow -print)
for f in $presets; do source $f; done

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
