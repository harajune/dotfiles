set nocompatible

syntax on
filetype on
filetype indent on
filetype plugin on
"inoremap <tab> <C-n>

" Windows/Linuxにおいて、.vimと$VIM/vimfilesの違いを吸収する
if has('win32') || has('win64')
    let $DOTVIM = $VIM."/vimfiles"
else
    let $DOTVIM = $HOME."/.vim"
endif

set title
set number
set ruler
set laststatus=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=\ (%l/%L,%v)%8P\
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
vnoremap <tab> ==
nnoremap <C-l> <ESC>:ls<CR>
nnoremap <C-b> <Tab> 
"nmap <C-e> $ 
"nnoremap <C-a> ^ 

set shellslash
filetype indent on

"Vim latexの設定(mac)
let g:tex_flavor='platex'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_BibtexFlavor = 'jbibtex'
let g:Tex_ViewRule_pdf = 'open -a /Applications/Preview.app'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_DefaultTargetFormat = 'pdf'

"changelog config
let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "harajune <harajune@gijutsuya.jp>"

autocmd BufNewFile,BufRead *.ru set filetype=ruby
autocmd BufNewFile,BufRead Rakefile set filetype=ruby

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

" bell off
set visualbell t_vb=

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:acp_enableAtStartup = 0
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'php' : $DOTVIM.'/dict/php.dict',
            \ 'smarty' : $DOTVIM.'/dict/smarty.dict',
            \ 'ruby' : $DOTVIM.'/dict/ruby.dict'
            \ }

let g:neocomplcache_snippets_dir = $DOTVIM.'/snippets'

" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" snippets expand key
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)

" snipetts
let g:snips_author = 'Jun Harada <harajune@gijutsuya.jp>'

" folding 
set foldmethod=marker

" ctags related
set tags=.tags;

" gtags related
nnoremap <C-]> :GtagsCursor<CR>
