" Detects we're editing Confluence files on MP Wiki
" TODO: Add more detection methods so we can spot the file type without
" relaying on the name alone.
augroup filetypedetect
	autocmd! BufReadPost,BufNewFile edit-server-mpwiki\.corp\.ebay\.com\.*\.txt	setfiletype confluence
augroup END
