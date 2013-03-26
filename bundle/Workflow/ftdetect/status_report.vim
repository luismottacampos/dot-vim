" Status Report file type detection
augroup filetypedetect
	" A file type for Status Reports
	autocmd! BufRead,BufNewFile [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].report	setfiletype status_report
augroup END
