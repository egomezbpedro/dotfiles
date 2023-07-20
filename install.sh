#!/usr/bin/env bash
#
echo "#################################"
echo "# Prefetching required packages #"
echo "#################################"

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt -qq update && sudo apt -y -qq install gum

gum format -- "# Welcome, let's configure this machine"

gum spin --spinner line --title "Feching Neovim prerequisites" -- sleep 30 | 
type -p curl >/dev/null || (sudo apt -qq update && sudo apt -qq install curl -y) &&
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt -qq update \
&& sudo apt -qq install gh -y

gum spin --spinner line --title "Feching Neovim prerequisites" -- sleep 30 | sudo apt-get -y -qq install ninja-build gettext cmake unzip
gum spin --spinner line --title "Cloning Neovim" -- sleep 30 | git clone https://github.com/neovim/neovim ~/neovim
cd ~/neovim
gum spin --spinner line --title "Building Neovim" -- sleep 30 | make CMAKE_BUILD_TYPE=RelWithDebInfo
gum spin --spinner line --title "Building Neovim" -- sleep 240 | sudo make install

gum spin --spinner line --title "Installing other tools" -- sleep 30 | sudo apt install -y -qq pipx fd-find ripgrep fzf stow tmux zsh
gum spin --spinner line --title "Fetching ohmyzsh" -- sleep 30 | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
gum spin --spinner line --title "Changing your Shell enviroment" -- sleep 30 | sudo usermod -s "/bin/zsh" ${USER}
gum spin --spinner line --title "Fetching the Neovim configuration" -- sleep 30 | git clone https://github.com/egomezbpedro/nvim-conf.git ~/.config/nvim \
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
gum spin --spinner line --title "Fetching system configuration" -- sleep 30 | git clone https://github.com/egomezbpedro/dotfiles.git ~/.dotfiles
gum spin --spinner line --title "Fetching tmux configuration" -- sleep 30 | git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
gum spin --spinner line --title "Cleaning" -- sleep 30 | rm ~/.zshrc \
stow -d ~/.dotfiles -t ~/ \
su - ${USER}
