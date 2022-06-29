# Install brew in the $HOME folder
git clone --depth=1 https://github.com/Homebrew/brew ~/.brew

# Add brew to the path on bash or zhs
echo 'export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"' > ~/.bashrc
echo 'export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"' > ~/.zshrc

# Install neovim, zsh, oh-my-posh
brew install neovim zsh oh-my-posh stow&

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended%

# Clone the dotfiles folder
git clone https://github.com/egomezbpedro/dotfiles.git ~/.dotfiles

rm -rf ~/.zsh* 
rm ~/.dotfiles/installer.sh

cd ~/.dotfiles && stow .



