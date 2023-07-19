#!/usr/bin/env bash
#
echo "#################################"
echo "# Prefetching required packages #"
echo "#################################"

if ! command -v gum &> /dev/null
then
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
    echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
    sudo apt -qq update && sudo apt -y -qq install gum

gum format -- "# Welcome, let's configure this machine"

gum spin --spinner line --title "Installing your tools and configuring your enviroment" -- sleep 1200 |
    type -p curl >/dev/null || (sudo apt -qq update && sudo apt -y -qq install curl) &&
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && 
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && 
    sudo apt -qq update &&
    sudo apt -y -qq install gh &&
    sudo apt-get -y -qq install ninja-build gettext cmake unzip && 
    git clone https://github.com/neovim/neovim ~/neovim && 
    cd ~/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install
    sudo apt install -y -qq pipx fd-find ripgrep fzf stow tmux zsh &&
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &&
    sudo usermod -s "/bin/zsh" ${USER} &&    
    git clone https://github.com/egomezbpedro/nvim-conf.git ~/.config/nvim &&
    git clone https://github.com/egomezbpedro/dotfiles.git ~/.dotfiles &&
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &&
    rm ~/.zshrc && cd ~/.dotfiles && stow . &&
    rm ~/install.sh ~/.gitignore &&
    su - ${USER}
fi
