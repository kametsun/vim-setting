" 構文チェック
 syntax enable

"---------------
"エンコーディング
"---------------
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding==UTF-8

"----------------
" スクロール
"----------------
" スクロール時に下が見えるようにする
set scrolloff=5

"----------------
" ファイル
"----------------
" スワップファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" 自動保存を有効にする
set autowrite
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" 保存されていないファイルがあるときでも別のファイルを開ける
set hidden
"----------------
" ターミナル
"----------------
" ターミナル接続を高速化
set ttyfast

"----------------
" エディタ
"----------------
" 長い行を折り返さない
set nowrap
" タイトルを表示
set title
" 行番号を表示
set number
" 対応する括弧に一瞬移動
set showmatch
" 対応する括弧への移動時間
set matchtime=1
" タブキーで補完を有効にする
set wildmode=list:full
" 折り返し表示を有効にする
set wrap
" ウィンドウの幅に合わせて折り返しを行う
set linebreak
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 全角文字専用の設定
set ambiwidth=double
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" コマンドラインの履歴を10000件保存する
set history=10000
" コメントの色を水色
hi Comment ctermfg=3
" カーソルラインを表示
"set cursorline
" 括弧補完
set backspace=indent,eol,start
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<Left>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<Left>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap " ""<Left>
inoremap ' ''<Left>


"----------------
" シンタックスハイライト
"----------------


"----------------
" インデント・タブ
"----------------
" 改行時に、前の行と同じ数だけ自動でインデントする
set autoindent
" 自動でインデントする際、「{」等のブロックに応じてインデントを調整
set smartindent
" タブ文字の空白数
set tabstop=4
" タブキーを押したときに挿入される空白数
set softtabstop=4
" ファイル内にあるタブ文字の表示幅
set tabstop=4
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" vimで読み込みのときにtabの幅をスペース4個分にする
set shiftwidth=4
"----------------
" コマンドライン
"----------------
" コマンドラインの高さ
set cmdheight=2
" 補完候補を一覧表示
set wildmenu
" 入力中のコマンドを表示する
set showcmd
"----------------
" 検索
"----------------
" 検索文字列をハイライト
set hlsearch
" 大文字・小文字を区別しない
set ignorecase
" インクリメンタルサーチ(一文字入力するごとに検索)
set incsearch
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan

"----------------
" java用
"----------------
:let java_highlight_all=1
:let java_highlight_debug=1
:let java_space_errors=1
:let java_highlight_functions=1

"----------------
" vim-plugの設定
"----------------
call plug#begin('~/.vim/plugged')
" 入れたいプラグインを書く
	Plug 'google/vim-maktaba'
	Plug 'google/vim-codefmt'
	Plug 'google/vim-glaive'
call plug#end()

call glaive#Install()
Glaive codefmt google_java_executable="java -jar /home/user0/google-java-format-1.18.1-all-deps.jar"

augroup autoformat_settings
	autocmd FileType bzl AutoFormatBuffer buildifier
    autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
	autocmd FileType dart AutoFormatBuffer dartfmt
	autocmd FileType go AutoFormatBuffer gofmt
	autocmd FileType gn AutoFormatBuffer gn
	autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
	autocmd FileType java AutoFormatBuffer google-java-format
	autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
	autocmd FileType rust AutoFormatBuffer rustfmt
	autocmd FileType vue AutoFormatBuffer prettier
	autocmd FileType swift AutoFormatBuffer swift-format
augroup END
