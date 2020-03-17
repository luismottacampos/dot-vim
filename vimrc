" Pathogen
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" File type related stuff
syntax on
filetype on
filetype plugin indent on
set foldmethod=manual
set ruler
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nohlsearch
set ignorecase
set smartcase
set autoindent
set wrap
set title
set linebreak
set visualbell
set t_vb=
set number
set encoding=utf-8
set modeline modelines=3

" Local Leader
let apleader= ','
let leader=','
let localleader=','
let mapleader=','
let maplocalleader=','

" Look and feel
set guifont=Monaco:h12
if has("gui_running")
    colorscheme mac_classic
else
    colorscheme desert
endif
