#!/bin/sh
# 参考：https://scrapbox.io/mrsekut-p/VSCodeの設定をdotfilesで管理する

# 実行しているスクリプトが置かれているpathへ移動
SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

# backup
mkdir "$SCRIPT_DIR/backup"
cp "$VSCODE_SETTING_DIR/settings.json" "$SCRIPT_DIR/backup"
cp "$VSCODE_SETTING_DIR/keybindings.json" "$SCRIPT_DIR/backup"
code --list-extensions > "$SCRIPT_DIR/backup/extensions"

# make symbolic links for vscode settings
rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"
