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
}

install_optional()
{
    if [ -d "~/.config" ]; then
        cp -r $PWD/i3 ~/.config/
        cp -r $PWD/i3status ~/.config/
    fi
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
    )

    install_rcfiles $RC_FILES
    install_repo
}

main

