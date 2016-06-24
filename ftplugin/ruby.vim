" Ruby File Type Settings
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set number

" ----------------------------------------
" Chef Setup stuff
" ----------------------------------------

" NerdTree Hook for Chef
function! ChefNerdTreeFind(env)
    try
        :NERDTreeFind
        let scrolloff_orig = &scrolloff
        let &scrolloff = 15
        normal! jk
        wincmd p
    finally
        let &scrolloff = scrolloff_orig
    endtry
endfunction

" Register the ChefNerdTreeFind function with the hook
let g:chef = {}
let g:chef.hooks = ['ChefNerdTreeFind']

" remove 'Related' from default, I want to find 'Related' explicitly.
let g:chef.any_finders = ['Attribute', 'Source', 'Recipe', 'Definition']

" Make the necessary arrangements and bindings for the Chef Plugin to work.
function! s:SetupChef()
    nnoremap <buffer> <silent> <LocalLeader>a      :<C-u>ChefFindAny<CR>
    nnoremap <buffer> <silent> <LocalLeader>f      :<C-u>ChefFindAnySplit<CR>
    nnoremap <buffer> <silent> <LocalLeader>r      :<C-u>ChefFindRelated<CR>
endfunction


" Sets an auto-command to setup the Chef plugin when the Path of the Ruby file
" opened has a "cookbooks" component (which apparently is one of the few ways
" in which one can distinguish between Plain Ruby and Chef's Ruby).
autocmd BufNewFile,BufRead */*cookbooks/*  call s:SetupChef()
