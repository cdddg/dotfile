# example
# https://github.com/masasam/dotfiles/blob/master/Makefile
.DEFAULT_GOAL := help

help: ## Show help message.
	@printf "Usage:\n"
	@printf "  make $(BLUE)<target>$(NC)\n\n"
	@printf "Targets:\n"
	@perl -nle'print $& if m{^[a-zA-Z0-9_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | \
		sort -f -k1,1 -k2,2 | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "$(BLUE)  %-18s$(NC) %s\n", $$1, $$2}'

all: install dots  ## install & dots

install: P_INSTALL_ALL  ## install packages

dots:  ## copy dots
	mkdir -p $$HOME/.vim/
	cp ./{.zshrc,.aliases,.vimrc,.tigrc,.lazygit,.gitconfig} $$HOME
	cp -ar .vim/* $$HOME/.vim/

# -----------------------------------------------------------------------------

P_INSTALL_HOMEBREW:
	sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

P_SETTING_HOMEBREW:
	sudo chown -R `whoami`:admin /usr/local/bin
	sudo chown -R `whoami`:admin /usr/local/share
	sudo chown -R `whoami`:admin /usr/local/opt
	brew cleanup $$FORMULA

P_INSTALL_PYENV:
	brew install pyenv

P_INSTALL_PYTHONS:
	CFLAGS="-I$(shell brew --prefix openssl)/include -I$(shell brew --prefix readline)/include -I$(shell xcrun --show-sdk-path)/usr/include" \
	LDFLAGS="-L$(shell brew --prefix openssl)/lib -L$(shell brew --prefix readline)/lib -L$(shell xcrun --show-sdk-path)/usr/lib" \
	pyenv install $(shell pyenv install --list | grep -E "^\s*3\.7\.[0-9].*" | tail -1)
	pyenv install $(shell pyenv install --list | grep -E "^\s*3\.8\.[0-9].*" | tail -1)
	pyenv install $(shell pyenv install --list | grep -E "^\s*3\.9\.[0-9].*" | tail -1)

P_UPGRADE_PIP:
	for ver in $(shell ls $$HOME/.pyenv/versions); do \
		$$HOME/.pyenv/versions/$$ver/bin/python -m pip install virtualenv &\
		$$HOME/.pyenv/versions/$$ver/bin/python -m pip install --upgrade pip; \
		done

P_INSTALL_ALL: \
	homebrew \
	dependencies \
	vim-plug \
	git tig lazygit \
	zsh zinit \
	macvim vscode docker fork font-fira-code translate \
	python \

# -----------------------------------------------------------------------------

homebrew: P_INSTALL_HOMEBREW P_SETTING_HOMEBREW

vim-plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git:
	brew install git

tig:
	brew install tig

lazygit:
	brew install lazygit

zsh:
	brew install zsh
	cat /etc/shells   # show shell list,  system default is bash
	chsh -s /bin/zsh  # set to defalut

zinit:
	rm -rf $$HOME/.zinit/
	git clone https://github.com/zdharma-continuum/zinit.git $$HOME/.zinit/

macvim:
	brew install --cask --force macvim

vscode:
	brew install --cask --force visual-studio-code

docker:
	brew install --cask --force docker

fork:
	brew install --cask --force fork

font-fira-code:
	brew tap homebrew/cask-fonts
	brew install --cask --force font-fira-code
	brew install --cask --force font-fira-code-nerd-font

translate:
	wget -O $$HOME/trans git.io/trans; chmod +x $$HOME/trans
	brew install gawk

python: P_INSTALL_PYENV P_INSTALL_PYTHONS P_UPGRADE_PIP

dependencies:
	# [coc-nvim]
		brew install openssl
		brew install node
	# [fzf]
		brew install ripgrep
	# [mysql]
		brew install mysql-connector-c
	# [zsh-autoswitch-virtualenv]
		brew install pwgen
	# -
		brew install lua
		brew install svn
		brew install coreutils
		brew install wget
		brew install zlib
		brew install bat
		brew install diffr
