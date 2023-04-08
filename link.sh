#!/bin/bash

# nounset
set -u
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_CONFIG_DIRECTORY=".config"

echo "link home directory dotfiles"
cd ${DOT_DIRECTORY}
for f in .??*
do
    # ignore files
    [ "$f" = ".git" ] && continue
    [ "$f" = ".config" ] && continue
    [ "$f" = ".DS_Store" ] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

echo "link .config directory dotfiles"
# これだけ手抜きで作っておく
mkdir  ${HOME}/${DOT_CONFIG_DIRECTORY}/git

cd ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}
for file in `\find . -maxdepth 8 -type f`; do
    [ ${file:2} = ".DS_Store" ] && continue
    echo ${file:2}
    ln -snfv ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}/${file:2} ${HOME}/${DOT_CONFIG_DIRECTORY}/${file:2}
done

echo "linked dotfiles complete!"
