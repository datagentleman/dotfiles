set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/tComment'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'taglist.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin '/terryma/vim-multiple-cursors'

set guifont=Monaco:h11

set nobackup
set nowritebackup
set noswapfile

set ts=2

" GUI options
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set showtabline=0  "show/hide tabs
set nocursorline

set statusline=%<\ %n:%f\ line:\ %l\ column:\ %c
set laststatus=2

" highlight search
set hlsearch

" turn off highlighting when press space
noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" move lines up/down
nnoremap <M-Down> :m+<CR>==
nnoremap <M-Up> :m-2<CR>==
vnoremap <M-Down> :m'>+<CR>gv=gv
vnoremap <M-Up> :m-2<CR>gv=gv

" display buffer list
map <Tab> \be

" File search
map <C-f> :CtrlP file<CR>

" display files and directories
map <Leader>a :NERDTree<CR>
map <Leader>q :NERDTreeClose<CR>

set smartindent
set autoindent

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" color scheme
set background=light
colorscheme solarized

" change default mapleader
let mapleader = "\\"

let loaded_matchparen = 1

fun! s:write_with_tags(path)
    silent! exe ":w"
    silent! exe "!ctags -R ". a:path
endfun

command! -nargs=1 Wt :call s:write_with_tags(<args>)


set rtp+=$GOROOT/misc/vim

" Go to Next/Previous page
nnoremap <C-n> :tabn<CR>
nnoremap <C-p> :tabp<CR>

:imap qq <Esc>

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_working_path_mode=''

set number

" delete(daw)/reprace(raw) word under cursor
nnoremap <C-d> ciw
nnoremap <C-c> caw

call vundle#end()

filetype plugin indent on

au BufRead,BufNewFile *.go set filetype=go

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)

" strip all whitespaces
autocmd BufWritePre * %s/\s\+$//e
