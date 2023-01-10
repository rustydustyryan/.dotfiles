#!/usr/bin/env zsh

brew update
brew upgrade

# Install brew tools

## utility
brew install coreutils # https://www.gnu.org/software/coreutils -- GNU File, Shell, and Text utilities
brew install findutils # https://www.gnu.org/software/findutils -- GNU `find`, `xargs`, and `locate`
brew install moreutils # https://joeyh.name/code/moreutils
brew install gnu-sed --with-default-names # GNU `sed`, overwriting the built-in `sed`
brew install gnupg
brew install rename
brew install wget
brew install imagemagick --with-webp

## terminal
brew install bash
brew install bash-completion2
brew install zsh
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
# Switch to using brew-installed zsh and bash
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then echo '/usr/local/bin/bash' | sudo tee -a /etc/shells; fi
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells; fi
# Use brew zsh as default shell
chsh -s /usr/local/bin/zsh

## search and filter
brew install ripgrep
brew install ack
brew install pt
brew install homebrew/dupes/grep
brew install tree
brew install fzf

## version control
brew install git
brew install hub

## list files
brew install exa
brew install tree

# misc
brew install asdf
brew install tldr

# Install macOS apps
brew tap caskroom/cask
brew cask --appdir="/Applications" install \
  one-password \
  iterm2 \
  spotify \
  karabiner-elements

# Remove outdated versions from the cellar
brew cleanup