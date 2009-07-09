syntax on
"inoremap <tab> <C-n>

set title
set number
set ruler
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%l/%L,%v)%8P\
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set incsearch
set smartcase
set hid

"keymap
nnoremap <C-n> <ESC>:bp<CR>
nnoremap <C-p> <ESC>:bn<CR>
nnoremap U <ESC>:redo<CR> 
nnoremap <tab> ==
imap <tab> <C-t>
imap <s-tab> <C-d>
nnoremap <C-l> <ESC>:ls<CR>
nnoremap <C-b> <ESC>:buffer 

