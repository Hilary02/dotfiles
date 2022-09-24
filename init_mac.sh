#!/bin/bash

# Initialize for Mac
./link.sh
./setup_zsh.sh

# Install Homebrew
echo "installing Homebrew ..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
cd $THIS_DIR

echo "run brew doctor ..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update ..."
which brew >/dev/null 2>&1 && brew update

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "ok. run brew upgrade ..."
brew upgrade
brew bundle
brew cleanup

# vscodeがインストールされた後にvscodeの設定コピーを実行
./vscode/vscode_mac.sh

# defaults系の変更
# see: https://do-zan.com/mac-dock-terminalcommand-settings/
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0.3
defaults write com.apple.dock autohide-time-modifier -float 0.3
# reboot Dock
killall Dock
