#!/bin/bash

REPO=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

symbolic_link() {
	local source=$1
	local target=$2

	if [ ! -e "$source" ]; then
		echo "Source $source does not exist."
		exit 1
	fi

	local target_dir=$(dirname "$target")
	if [ ! -d "$target_dir" ]; then
		echo "Target directory $target_dir does not exist. Creating it..."
		mkdir -p "$target_dir"
	fi

	if [ -e "$target" ] || [ -L "$target" ]; then
		echo "$target already exists. Removing it..."
		rm -rf "$target"
	fi

	ln -s "$source" "$target"
	echo "Successfully created symlink: $target -> $source"
}

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
symbolic_link "$REPO/.aliases" "$HOME/.aliases"
symbolic_link "$REPO/.tigrc" "$HOME/.tigrc"
symbolic_link "$REPO/.zshrc" "$HOME/.zshrc"
symbolic_link "$REPO/.tmux.conf" "$HOME/.tmux.conf"
symbolic_link "$REPO/.config/nvim" "$HOME/.config/nvim"

