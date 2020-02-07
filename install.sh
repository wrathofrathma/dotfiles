#!/bin/bash

echo "Installing rathma's dotfiles to $1"

mkdir -p $1/.config/nvim
mkdir -p $1/.config/alacritty
mkdir -p $1/.config/i3
mkdir -p $1/.cache

cp --remove-destination /opt/dotfiles/zshrc $1/.zshrc
cp --remove-destination /opt/dotfiles/init.vim $1/.config/nvim/init.vim
cp --remove-destination /opt/dotfiles/tmux.conf $1/.tmux.conf
cp --remove-destination /opt/dotfiles/alacritty.yml $1/.config/alacritty/alacritty.yml
cp --remove-destination /opt/dotfiles/i3config $1/.config/i3/config

curl -fLo $1/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
