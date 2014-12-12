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

" PERL5LIB environment variable
let $PERL5LIB=$HOME.'/perl5/lib/perl5'

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

" ctags-exhuberant stuff
set tags+=tags
" update tagfile
" map <Localleader>T :!find $HOME/src -name "*.pp" \| ctags -f ~/src/tags --format=2 --excmd=pattern --fields=nks -L - <CR>
" autocmd FileType puppet set iskeyword=-,:,@,_
autocmd FileType puppet set iskeyword=-,:,@,48-57,_,192-255


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

" Runs perltidy, and goes back to current line before filtering.
function! Perltidy()
    let current_line = line('.')
    let perltidy     = '/usr/bin/perl -I/Users/lucampos/perl5/lib/perl5 /Users/lucampos/perl5/bin/perltidy'
    execute ":0,$!" . perltidy . " -pbp"
    execute ":" . current_line
endfunction
map <Localleader>t :call Perltidy()<Cr>
