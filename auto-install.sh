#!/bin/bash

# FILEPATH: /c:/Development/projects/personal/windows-zsh/auto-install.sh

# Get the first argument passed to the script
git_sdk_path=$1

# Use the variable in your script
echo "The value of var is: $git_sdk_path"

# install zsh
# see https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#arch-linux-or-manjaro
pacman -S --noconfirm zsh

# to fix common error when running zsh on git-sdk-bash: if you get error when opening "ERROR: this script is obsolete, please see git-completion."
# see https://stackoverflow.com/a/69396005/10577976
echo "" > ~/.config/git/git-prompt.sh

# install oh-my-zsh
# see https://ohmyz.sh/#install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k theme
# see https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install zsh auto-suggestions plugin
# see https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh syntax-highlighting plugin
# see https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#in-your-zshrc
# note: this command is adjusted to clone to ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting instead of local dir like the docs suggest
# this would add the plugin zsh-syntax-highlighting to oh-my-zsh plugins dir
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# this would activate the plugin when zsh starts
echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# install fzf
# see https://github.com/junegunn/fzf?tab=readme-ov-file#using-git
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# add as windows profile
wt -p "Ubuntu-20.04" -d $git_sdk_path
