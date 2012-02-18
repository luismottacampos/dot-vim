" File Type Plugin Progress-Problem-Plans Report

" Only do this when not done yet for this buffer
" if exists("b:did_PPP_plugin")
"   finish
" endif
" let b:did_PPP_plugin = 1

" Configuration Options
let s:worklog_dir = '/Users/lucampos/Documents/Worklog'

" Spell Checking is important and should be always active.
setlocal spell
setlocal spelllang=en_gb

" Add mappings, unless the user didn't want this.
if !exists("no_plugin_maps") && !exists("no_mail_maps")
        " No mappings here (yet)
endif

" Date Generation Functions

" Simple days-to-seconds conversion function
function! DaysToSeconds( days )
        return 86400 * a:days 
endfunction

" Returns the unixtimestamp of a day <days_ago> from now
function! GetUnixTimeFrom( days_ago )
        return localtime() - DaysToSeconds( a:days_ago )
endfunction

" Produces a dictionary with keys "year", "month", "day", "week", maybe for
" <days_ago> days in the past.
function! GetDateAsDictionary( days_ago )
        let tmp_date = split( strftime( '%Y %m %d %W', GetUnixTimeFrom( a:days_ago ) ) )
        let date = { 'year': tmp_date[0], 'month': tmp_date[1], 'day': tmp_date[2], 'week': tmp_date[3] }
        return date
endfunction

" ReportFileNameForDate( date )
function! ReportFileNameForDate( date )
        let file_format = '%s/%04d/%02d/%04d%02d%02d.report'
        let filename = printf( file_format, s:worklog_dir, a:date['year'], a:date['month'], a:date['year'], a:date['month'], a:date['day'] )
        return simplify( filename )
endfunction

" ReadLogEntriesFromFile( filename )
function! ReadLogEntriesFromFile( filename )
        let report = []
        if filereadable( a:filename )
                for line in readfile( a:filename )
                        if line =~ '^\* '
                                call add( report, line )
                        endif
                endfor
        endif
        return report
endfunction

" GetLogEntriesFrom( days_ago )
function! GetLogEntriesForDate( date )
        if ! a:days_ago
                let a:days_ago = 0
        endif
        return ReadLogEntriesFromFile( ReportFileNameForDate( GetDateAsDictionary( days_ago ) ) )
endfunction

" ComposeStatusReport() builds a status report 
function! ComposeStatusReport ()

        let l:report = [ 'PPP Week '.system( '/bin/date +"%W"' ), '', 'Progress' ]

        let l:days = [ 7, 6, 5, 4, 3, 2, 1 ]
        for l:day in l:days 
                let l:date = split( system( printf( '/bin/date -v-%sd +"%%Y %%m %%d"', day ) ) )
                let l:report_file = simplify( printf( '%s/%04d/%02d/%04d%02d%02d.report', s:worklog_dir, l:date[0], l:date[1], l:date[0], l:date[1], l:date[2] ) )
                if filereadable( l:report_file )
                        for line in readfile( l:report_file )
                                if line =~ '^\* '
                                        call add( l:report, line )
                                endif
                        endfor
                endif
        endfor

        " Report Additional Headers
        call add( l:report, '' )
        call add( l:report, 'Problems' )
        call add( l:report, '' )
        call add( l:report, 'Plans' )
        call append( 0, l:report )

endfunction
