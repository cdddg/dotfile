#!/usr/bin/env bash

# Installs Homebrew, updates it, upgrades any installed formulae, and changes ownership of Homebrew directories.
# It also installs a variety of essential tools and utilities using Homebrew.

# Install Homebrew if it's not already installed.
if ! command -v brew >/dev/null 2>&1; then
	sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install | bash
fi

# Change the ownership of Homebrew directories to the current user.
sudo chown -R $(whoami):admin /usr/local/bin
sudo chown -R $(whoami):admin /usr/local/share
sudo chown -R $(whoami):admin /usr/local/opt

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install `wget` with IRI support.
brew install wget --with-iri

# Install git tools
brew install git
brew install tig
brew install lazygit
brew install bat
brew install hub
brew install --cask --force fork

# Install a modern version of zsh.
brew install zsh
# brew install bash-completion2

# Install neovim
brew install neovim

# Install translate tool
wget -O $HOME/trans git.io/trans
chmod +x $HOME/trans
brew install gawk

# Install MySQL tool
brew install mysql-connector-c

# Install others (dependencies for various tools)
brew install lua
brew install svn
brew install tree
brew install openssl
brew install zlib

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
	echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells
	chsh -s "${BREW_PREFIX}/bin/bash"
fi

# Remove outdated versions from the cellar.
brew cleanup

