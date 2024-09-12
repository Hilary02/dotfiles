#!/bin/bash

# Initialize for Mac
./link.sh
./setup_zsh.sh

# update permission
chmod 744 ./backup_mac.sh

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

# musicの自動起動の無効化
# https://randomsense.net/play-arbitrarily-applemusic/
launchctl disable gui/"$(id -u)"/com.apple.rcd
launchctl kill SIGTERM gui/"$(id -u)"/com.apple.rcd

# defaults系の変更
# see: https://do-zan.com/mac-dock-terminalcommand-settings/
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0.02
defaults write com.apple.dock autohide-time-modifier -float 0.1
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# 動きを高速化
defaults write -g com.apple.trackpad.scaling 3 && \
defaults write -g com.apple.mouse.scaling 2 && \
defaults write -g KeyRepeat -int 1 && \
defaults write -g InitialKeyRepeat -int 15

# クラッシュレポートを無効化する
defaults write com.apple.CrashReporter DialogType -string "none"

# Finderで情報ウィンドウを開くときのアニメーションを無効
defaults write com.apple.finder DisableAllAnimations -bool true
# 全ての拡張子のファイルを表示する
defaults write -g AppleShowAllExtensions -bool true
# .DS_Storeファイルを作らせない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE


# スクショの影を消す
defaults write com.apple.screencapture disable-shadow -boolean true
# スクリーンショットをjpgで保存
defaults write com.apple.screencapture type jpg

# ウィンドウサイズを調整する際の加速再生
defaults write -g NSWindowResizeTime 0.001
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
# reboot Dock
killall Dock
