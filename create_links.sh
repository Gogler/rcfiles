#!/bin/bash

y_n() {
    while true; do
        read -p "$1 (y/n)?: " CHOICE
        case "$CHOICE" in
            y|Y|yes ) return 1 ;;
            n|N|no ) return 0 ;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

install_rcfiles()
{
    RC_FILES=$1
    for files in ${RC_FILES[@]}; do
        if [ -f ~/.${files} ]; then
            y_n "File .${files} exist do you want replace it with repo file (the file wile be moved to ${files}.BAK)"
            if [ $? -ne 0  ]; then
                mv ~/.${files} ~/${files}.BAK
                ln -s $PWD/${files} ~/.${files}
            else
                echo "Skiping ${files}"
            fi
        else
            echo "Creat simlink for ${files}"
            ln -s $PWD/${files} ~/.${files}
        fi
    done
}

install_repo()
{
    REPOS=(
    "https://github.com/powerline/powerline"
    "https://github.com/powerline/fonts"
    "https://github.com/chriskempson/base16-shell"
    )

    which git > /dev/null
    if [ $? -ne 0  ]; then
        echo "No git installed"
        exit -1
    fi
    if [ ! -d ~/.local ]; then
        mkdir ~/.local
    fi
    pushd ~/.local
    for repos in ${REPOS[*]}; do
        git clone ${repos}
    done
    popd

    ln -s ~/.local/powerline/scripts/* ~/bin/
}

install_optional()
{
    if [ -d ~/.config ]; then
        ln -s $PWD/i3 ~/.config/
        ln -s $PWD/i3status ~/.config/
    else
        echo "~/.config dir does not exist"
    fi
}

install_pkg()
{
    for pkg in $(cat pacman_list.txt); do
        pacman -S $pkg
    done;
}

main()
{
    RC_FILES=(
    'alias_export'
    'bashrc'
    'screenrc'
    'tmux.conf'
    'vimrc'
    'Xresources'
    'zshrc'
    'bin'
    'mplayer'
    'fehbg'
    'xbindkeysrc'
    )

    #install_rcfiles $RC_FILES
    #install_repo
    install_optional
}

main

