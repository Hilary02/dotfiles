# 補完
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -Uz compinit && compinit

# 補完候補をメニューから選択する。
## select=2:補完候補を一覧から選択する。
##          ただし、補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                              /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
                              /usr/local/git/bin

# プラグインの読み込み
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ブロンプト複数起動時のhistory共有
setopt share_history
# コピペしやすいようにコマンド実行後は右プロンプトを消す
setopt transient_rprompt
# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups
# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd
# auto_pushdで重複するディレクトリは記録しない
setopt pushd_ignore_dups
# 先頭がスペースで始まる場合は履歴に追加しない
setopt hist_ignore_space

# lsの色付け
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=33;46'

# 補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# powerline
function left-prompt {
  name_t='179m%}' # user name text color
  name_b='000m%}' # user name background color
  path_t='255m%}' # path text color
  path_b='031m%}' # path background color
  time_t='000m%}'
  time_b='220m%}'
  arrow='087m%}'  # arrow color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}' # reset
  sharp="\uE0B0"    # triangle
  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
# echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${sharp} %* ${dir}%~${reset}$ {text_color}${path_b}${sharp}${reset}\n${text_color}${arrow}> ${reset}"
  echo "${user}%n%#@%m${back_color}${path_b}${text_color}${name_b}${back_color}${time_b}${sharp}${text_color}${time_t}%*${back_color}${path_b}${text_color}${time_b}${sharp}${dir}%~${reset}${text_color}${path_b}${sharp}${reset}\n${text_color}${arrow}> ${reset}"
}

# Gitステータス表示
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

PROMPT=`left-prompt`
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# Shift矢印で単語移動
bindkey ";2C" forward-word
bindkey ";2D" backward-word

# 短縮コマンド
function history-all { history -E 1 }
function vizshrc { vim ~/.zshrc }

alias -g gr='| grep --color=auto'
alias -g L='| less'
alias -g C='| pbcopy'

