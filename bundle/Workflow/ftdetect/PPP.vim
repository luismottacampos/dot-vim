" PPP Report file type detection
augroup filetypedetect
	" A file type for Progress-Problem-Plans Reports
	autocmd! BufRead,BufNewFile [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].ppp	setfiletype PPP
augroup END
