" My own file type detection
if exists( "did_load_filetypes" )
	finish
endif
augroup filetypedetect
	" A file type for Status Reports
	autocmd! BufRead,BufNewFile [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].report	setfiletype status_report
augroup END
