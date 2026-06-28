#!/bin/bash

# Install xCode cli tools
if [[ "$(uname)" == "Darwin" ]]; then
    echo "macOS deteted..."

    if xcode-select -p &>/dev/null; then
        echo "Xcode already installed"
    else
        echo "Installing commandline tools..."
        xcode-select --install
    fi
fi

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
## install zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae
brew install satococoa/tap/wtp

## Formulae
echo "Installing Brew Formulae..."

## Core Utils
echo "Install gnu coreutils"
brew install coreutils

### Must Have things
brew install fastfetch
brew install stow
brew install fzf
brew install bat
brew install fd
brew install zoxide
brew install make
brew install qmk
brew install ripgrep
brew install direvn

brew install go
brew install golangci-lint
brew install lua
brew install luajit
brew install luarocks
brew install prettier

### Terminal
brew install git
brew install lazygit
brew install tmux
brew install neovim
brew install starship
brew install tree-sitter
brew install tree
brew install chafa # render images in terminal

### dev things
brew install node
brew install nvm
brew install postgresql@18
brew install sqlite
brew install protobuf && go install google.golang.org/protobuf/cmd/protoc-gen-go@latest \
    && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
brew install swag

## Casks
brew install --cask docker
brew install --cask ghostty 
brew install --cask nikitabobko/tap/aerospace
brew install --cask obsidian
# brew install --cask betterdisplay
# brew install --cask linearmouse
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-sf-pro

## MacOS settings
# echo "Changing macOS defaults..."
# defaults write com.apple.Dock autohide -bool TRUE
# defaults write NSGlobalDomain KeyRepeat -int 2
# defaults write InitialKeyRepeat -int 15

csrutil status
echo "Installation complete..."

# Clone dotfiles repository
if [ ! -d "$HOME/dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  git clone https://github.com/vladgrskkh/dotfiles.git $HOME/dotfiles
fi

# export gnu coreutils to path
echo 'export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"' >> ~/.zshrc

# Navigate to dotfiles directory
cd $HOME/dotfiles || exit

# Stow dotfiles packages
echo "Stowing dotfiles..."
stow -t ~ aerospace direnv ghostty nvim starship tmux zsh

echo "Dotfiles setup complete!"
