#!/usr/bin/env bash
#
echo "Prefetching needed packages"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt -qq update && sudo apt -qq install gum

gum format -- "# Welcome, let's configure this machine"

TASK=$(gum choose "tools" "dotfiles")

if [ "$TASK" = "tools" ]; then
    gum spin --spinner line --title "Installing your tools" -- sleep 300 | sudo apt -qq update \
        sudo apt install -y -qq pipx fd-find ripgrep fzf stow tmux\
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm \
        type -p curl >/dev/null || (sudo apt -qq update && sudo apt -qq install curl -y)
        curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
        && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
        && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
        && sudo apt -qq update \
        && sudo apt -qq install gh -y \
        sudo apt-get install ninja-build gettext cmake unzip \
        git clone https://github.com/neovim/neovim ~/ \
        cd ~/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo \
        sudo make install \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi


if [ "$TASK" = "dotfiles" ]; then
    gum spin --spinner line --title "Configuring your enviroment" -- sleep 60 \
       git clone https://github.com/egomezbpedro/nvim-conf.git ~/.config/nvim \
       git clone https://github.com/egomezbpedro/dotfiles.git ~/.dotfiles \
       rm ~/.zshrc ~/.tmux.conf \
       cd ~/.dotfiles/ \
       stow . \
       rm -rf ~/.git*

fi
