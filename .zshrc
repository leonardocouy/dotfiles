export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/usr/local/bin"
ZSH_THEME="robbyrussell"

export ASPNETCORE_ENVIRONMENT="Development"
plugins=(git)

source $ZSH/oh-my-zsh.sh

## Sourcing presets

typeset -ga sources

sources+="$HOME/.presets/.aliases"
sources+="$HOME/.presets/.functions"
sources+="$HOME/.presets/.system"
for file in $sources[@]; do
  source "$file"
done

if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook

### autoload nvmrc
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

### Added by Zplugin's installer
source $HOME/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-completions
zplugin load zdharma/history-search-multi-word
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light dfurnes/purer
