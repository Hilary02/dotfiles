# 実行しているスクリプトが置かれているpathへ移動
$SCRIPT_DIR = $MyInvocation.MyCommand.Path
$PSScriptRoot

$VSCODE_SETTING_DIR = "$env:HOME/AppData/Roaming/Code/User"


mkdir "$PSScriptRoot/backup"
cp "$env:VSCODE_SETTING_DIR/settings.json" "$PSScriptRoot/backup/"
cp "$env:VSCODE_SETTING_DIR/keybindings.json" "$PSScriptRoot/backup"
code --list-extensions > "$PSScriptRoot/backup/extensions"

# make symbolic links for vscode settings
rm "$VSCODE_SETTING_DIR/settings.json"
New-Item -ItemType SymbolicLink -Path "$VSCODE_SETTING_DIR/settings.json" -Value "$PSScriptRoot/settings.json"
# mklink /H "$VSCODE_SETTING_DIR/settings.json" "$PSScriptRoot/settings.json"

rm "$VSCODE_SETTING_DIR/keybindings.json"
New-Item -ItemType SymbolicLink -Path "$VSCODE_SETTING_DIR/keybindings.json" -Value "$PSScriptRoot/keybindings.json"
# mklink /H "$VSCODE_SETTING_DIR/keybindings.json" "$PSScriptRoot/keybindings.json"