#!/usr/bin/bash

PACMAN_PACKAGES="git docker docker-compose"
sudo pacman -S --needed  --noconfirm $PACMAN_PACKAGES

REMOVABLE_PACKAGES="firefox ms-office-online manjaro-hello hplip"
sudo pacman -Rsn --noconfirm $REMOVABLE_PACKAGES

YAY_PACKAGES="google-chrome visual-studio-code-bin deezer keybase-bin rubymine sublime-merge" 
yay -S --needed --noconfirm $YAY_PACKAGES


## Keybase
rm -f ~/.config/autostart/keybase_autostart.desktop

## Docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash