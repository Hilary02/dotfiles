" 行番号
set number
" シンタックスハイライト
syntax on
" スマートインデント
set smartindent


" vimの矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double

" --検索系--
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索(検索ワードの最初の文字を入力した時点で検索が
set incsearch
" 検索結果をハイライト表示
set hlsearch
" 対応する括弧を強調表示
set showmatch
