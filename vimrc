" Pathogen
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" File type related stuff
syntax on
filetype on
filetype plugin indent on
set ruler expandtab tabstop=4 softtabstop=4

" Local Leader
let apleader= ','
let leader=','
let localleader=","
let mapleader=","
let maplocalleader=','

" Look and feel
set guifont=Monaco:h14
if has("gui_running")
    colorscheme mac_classic
else
    colorscheme desert
endif

" Search options
set ignorecase
set smartcase

" Opens Today's Status Report
function! CreateOrOpenCurrentECGStatusReport()
    let l:dirname = '/Users/lucampos/Documents/Worklog/' . strftime( '%Y/%m/', localtime() )
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

