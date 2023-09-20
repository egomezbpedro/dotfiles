#!/usr/bin/env bash
#

check_homebrew () {
    if [ -x $(brew --version) ]
    then
        echo "installing homebrew"
    fi
}

if $(bash --version)

then

    echo "Installing"
    check_homebrew()

fi
