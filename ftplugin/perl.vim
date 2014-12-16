" PERL5LIB environment variable
let $PERL5LIB=$HOME.'/perl5/lib/perl5'

" Runs perltidy, and goes back to current line before filtering.
function! Perltidy()
    let current_line = line('.')
    let perltidy     = '/usr/bin/perl -I/Users/lucampos/perl5/lib/perl5 /Users/lucampos/perl5/bin/perltidy'
    execute ":0,$!" . perltidy . " -pbp"
    execute ":" . current_line
endfunction
map <Localleader>t :call Perltidy()<Cr>
