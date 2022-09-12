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

echo "ok. run brew upgrade ..."
brew upgrade
brew bundle
brew cleanup

# vscodeがインストールされた後にvscodeの設定コピーを実行
./vscode/vscode_mac.sh