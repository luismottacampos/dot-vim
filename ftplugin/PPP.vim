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

" ReadEntriesMatching( pattern )
function! ReadEntriesMatching( filename, pattern )
        let entries = []
        if filereadable( a:filename )
                for line in readfile( a:filename )
                        if line =~ a:pattern
                                call add( entries, line )
                        endif
                endfor
        endif
        return entries
endfunction

" ReadLogEntriesFromFile( filename )
function! ReadLogEntriesFromFile( filename )
        return ReadEntriesMatching( a:filename, '^\* ' )
endfunction

" ReadToDoEntriesFromFile( filename )
function! ReadToDoEntriesFromFile( filename )
        return ReadEntriesMatching( a:filename, '\(TODO\)' )
endfunction

" GetLogEntriesFrom( days_ago )
function! GetLogEntriesFrom( days_ago )
        if ! a:days_ago
                let a:days_ago = 0
        endif
        return ReadLogEntriesFromFile( ReportFileNameForDate( GetDateAsDictionary( a:days_ago ) ) )
endfunction

" GetToDoEntriesFrom( days_ago )
function! GetToDoEntriesFrom( days_ago )
        return ReadToDoEntriesFromFile( ReportFileNameForDate( GetDateAsDictionary( a:days_ago ? a:days_ago : 0 ) ) ) 
endfunction

" PPPHeader()
function! PPPHeader()
        return strftime( 'PPP Week %W' )
endfunction

function! GetPPPLogEntries()
        let entries = []
        for day in [ 7, 6, 5, 4, 3, 2, 1 ]
              call extend( entries, GetLogEntriesFrom( day ) )  
        endfor
        return entries
endfunction

" GetPPPToDoItems()
function! GetPPPToDoItems()
        let entries = []
        for day in [ 7, 6, 5, 4, 3, 2, 1, 0, -1, -2, -3 ]
                call extend( entries, GetToDoEntriesFrom( day ) )
        endfor
        return entries
endfunction

" PPP()
function! PPP()
        let report = []
        call add( report, PPPHeader() )
        call add( report, '' )
        call add( report, 'Progress' )
        call extend( report, GetPPPLogEntries() )
        call add( report, '' )
        call add( report, 'Problems' )
        call add( report, '' )
        call add( report, 'Plans' )
        call extend( report, GetPPPToDoItems() )
        return report
endfunction
