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
set diffopt+=iwhite
set encoding=utf-8
set modeline modelines=3

" Local Leader
let apleader= ','
let leader=','
let localleader=','
let mapleader=','
let maplocalleader=','

" Look and feel
set guifont=Monaco:h14
if has("gui_running")
    colorscheme mac_classic
else
    colorscheme desert
endif

" Syntastic extensions
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Search options
set ignorecase
set smartcase

" Set appropriated tab and space options per filetype.
autocmd Filetype shell      setlocal ts=4 sw=4       expandtab
autocmd Filetype puppet     setlocal ts=2 sw=2       expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab

" SuperTab + Omnicompletion = win
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<C-x><C-o>'
" call SuperTabContextDefaultCompletionType(<C-x><C-o>')
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" Racer Completion experiment
set hidden
let g:racer_cmd = "/Users/luis/.cargo/bin/racer"
" let $RUST_SRC_PATH="<path-to-rust-srcdir>/src/"

" Global variable definitions for my work journal.
let g:work_journal_work_dir = '/Users/luis/Documents/Worklog'
let g:work_journal_todo_list_link = 'https://pagerduty.atlassian.net/wiki/x/KoCzC'
