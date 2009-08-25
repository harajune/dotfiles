set nocompatible
filetype plugin on

syntax on
"inoremap <tab> <C-n>

set title
set number
set ruler
set laststatus=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%l/%L,%v)%8P\
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set incsearch
set smartcase
set hid

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"bacspace インデントと改行を削除できるようにする
set bs=eol,start

"クリップボードと共有
set clipboard=unnamed

"keymap
nnoremap <C-n> <ESC>:bp<CR>
nnoremap <C-p> <ESC>:bn<CR>
nnoremap <C-c> <ESC>:bd<CR>
nnoremap U <ESC>:redo<CR> 
nnoremap <tab> ==
imap <tab> <C-t>
imap <s-tab> <C-d>
nnoremap <C-l> <ESC>:ls<CR>
nnoremap <C-b> <ESC>:buffer 
nmap <C-e> $ 
nnoremap <C-a> ^ 

set shellslash
filetype indent on

"Vim latexの設定(mac)
let g:tex_flavor='platex'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_BibtexFlavor = 'jbibtex'
let g:Tex_ViewRule_pdf = 'open -a /Applications/Preview.app'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'

"changelog config
let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "harajune <harajune@gijutsuya.jp>"

"for binary
""バイナリ編集(xxd)モード（vim -b での起動、もしくは *.binファイルを開くと発動します）
augroup BinaryXXD
    autocmd!
    autocmd BufReadPre  *.bin let &binary =1
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | %!xxd -r | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END

