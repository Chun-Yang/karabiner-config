#!/bin/sh

# install Karabiner-Elements
if [ ! -d /Applications/Karabiner-Elements.app ]
then
  echo "[INFO] Karabiner-Elements is not installed, please install Karabiner-Elements and re-run"
  open https://pqrs.org/osx/karabiner/
  exit
fi

# clone repo
USER_NAME=Chun-Yang
if [ -d ~/.karabiner-config ]
then
  echo "[INFO] karabiner-config is installed, updating now..."
  git -C ~/.karabiner-config pull git@github.com:${USER_NAME}/karabiner-config.git
else
  echo "[INFO] karabiner-config is not installed, installing karabiner-config..."
  git clone https://github.com/${USER_NAME}/karabiner-config ~/.karabiner-config
fi

# link ~/.config/karabiner folder
if [ -d ~/.config/karabiner ]
then
  if [ "`readlink ~/.config/karabiner`" != "$HOME/.karabiner-config/karabiner" ]
  then
    echo "[INFO] existing ~/.config/karabiner file is moved to ~/.config/karabiner.backup"
    mv ~/.config/karabiner ~/.config/karabiner.backup
    echo "[INFO] link ~/.karabiner-config/karabiner to ~/.config/karabiner"
    ln -s ~/.karabiner-config/karabiner ~/.config/karabiner
  fi
else
  echo "[INFO] link ~/.karabiner-config/karabiner to ~/.config/karabiner"
  ln -s ~/.karabiner-config/karabiner ~/.config/karabiner
fi
