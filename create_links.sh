#!/bin/bash

ln -s $PWD/alias_export ~/.alias_export
ln -s $PWD/bashrc ~/.bashrc
ln -s $PWD/screenrc ~/.screenrc
ln -s $PWD/tmux.conf ~/.tmux.conf
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/Xresources ~/.Xresources
ln -s $PWD/zshrc ~/.zshrc
ln -s $PWD/bin ~/bin

if [ -d "~/.config" ]; then
    cp -r $PWD/i3 ~/.config/
    cp -r $PWD/i3status ~/.config/
fi
