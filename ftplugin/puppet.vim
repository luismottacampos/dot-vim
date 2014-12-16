" ctags-exhuberant stuff
set tags+=tags

" update tagfile
" map <Localleader>T :!find $HOME/src -name "*.pp" \| ctags -f ~/src/tags --format=2 --excmd=pattern --fields=nks -L - <CR>
"
" autocmd FileType puppet set iskeyword=-,:,@,_
autocmd FileType puppet set iskeyword=-,:,@,48-57,_,192-255


" Syntastic puppet-lint command arguments
" https://github.com/scrooloose/syntastic#faqargs
let g:syntastic_puppet_puppetlint_args = '--no-80chars-check'
