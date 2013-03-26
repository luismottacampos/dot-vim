"
" Status Report Utility functions 
"
" A vim script by LMC

source ~/.vim/plugin/DateFunctions.vim

function! GetStatusReportHeader ( cityString, countryString )
	let l:date = GetDateAsDictionary( 0 )
	let l:headerTemplate = 'DBA Status Report %04d-%02d-%02d (%s, %s)'
	return printf( l:headerTemplate, l:date['year'], l:date['month'], l:date['day'], a:cityString, a:countryString )
endfunction 

