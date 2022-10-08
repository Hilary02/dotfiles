#!/bin/bash
set -eu
DOT_DIRECTORY="${HOME}/dotfiles"

mv ${DOT_DIRECTORY}/Brewfile ${DOT_DIRECTORY}/Brewfile.bak
brew bundle dump