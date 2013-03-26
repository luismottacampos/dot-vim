" File Type Plugin for the type "status_report" 

" Only do this when not done yet for this buffer
" if exists("b:did_status_report_plugin")
"   finish
" endif
" let b:did_status_report_plugin = 1

" Spell Checking is important and should be always active.
setlocal spell
setlocal spelllang=en_gb

function! GetStatusReportHeader ( cityString, countryString )
	let l:date = Workflow#GetDateAsDictionary( 0 )
	let l:headerTemplate = 'DBA Activity Report %04d-%02d-%02d (%s, %s)'
	return printf( l:headerTemplate, l:date['year'], l:date['month'], l:date['day'], a:cityString, a:countryString )
endfunction 

function! AddStatusReportHeader( cityString, countryString )
	let failed = append( 0, GetStatusReportHeader( a:cityString, a:countryString ) )
endfunction

function! AddAmsterdamStatusReportHeader()
	call AddStatusReportHeader( 'Amsterdam', 'NL' )
endfunction

function! AddMilanStatusReportHeader()
	call AddStatusReportHeader( 'Milan', 'IT' )
endfunction

function! AddBerlinStatusReportHeader()
	call AddStatusReportHeader( 'Berlin', 'DE' )
endfunction

function! AddLondonStatusReportHeader()
	call AddStatusReportHeader( 'London', 'GB' )
endfunction

" Add mappings, unless the user didn't want this.
if !exists("no_plugin_maps") && !exists("no_mail_maps")
        map <buffer> <silent> <LocalLeader>HA :call AddAmsterdamStatusReportHeader()<CR>
	map <buffer> <silent> <LocalLeader>HM :call AddMilanStatusReportHeader()<CR>
	map <buffer> <silent> <LocalLeader>HB :call AddBerlinStatusReportHeader()<CR>
	map <buffer> <silent> <LocalLeader>HL :call AddLondonStatusReportHeader()<CR>
endif

