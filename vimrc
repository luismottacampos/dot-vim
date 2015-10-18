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
let localleader=","
let mapleader=","
let maplocalleader=','

" Look and feel
set guifont=Monaco:h12
if has("gui_running")
    colorscheme mac_classic
else
    colorscheme desert
endif

" Search options
set ignorecase
set smartcase

" Set appropriated tab and space options per filetype.
autocmd Filetype shell      setlocal ts=4 sw=4       expandtab
autocmd Filetype ruby       setlocal ts=2 sw=2       expandtab
autocmd Filetype puppet     setlocal ts=2 sw=2       expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab

" Opens Today's Status Report
function! CreateOrOpenCurrentECGStatusReport()
    let l:dirname = '/Users/lcampos/Documents/Worklog/' . strftime( '%Y/%m/', localtime() )
    let l:filename = l:dirname . strftime( '%Y%m%d.report', localtime() )
    
    if exists("*mkdir")
        if ! isdirectory( l:dirname )
            call mkdir( l:dirname, 'p' )
        endif
    endif
    execute 'edit! ' . l:filename
    call AddAmsterdamStatusReportHeader()
endfunction
map <Localleader>S :call CreateOrOpenCurrentECGStatusReport()<CR>

