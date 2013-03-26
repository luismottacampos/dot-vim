" **************************************************
" File Type Plugin Progress-Problem-Plans Report
" **************************************************

" **************************************************
" Boilerplate
" Only do this when not done yet for this buffer
" **************************************************
"if exists("b:did_PPP_plugin") || &cp
	"finish
"endif
"let b:did_PPP_plugin = 1

" **************************************************
" Configuration Options
" **************************************************
let s:worklog_dir = '/Users/lucampos/Documents/Worklog'

" **************************************************
" Buffer-Local Settings
" **************************************************
" Spell Checking is important and should be always active.
setlocal spell
setlocal spelllang=en_gb

" **************************************************
" Keyboard Mappings
" **************************************************
" Add mappings, unless the user didn't want this.
if !exists("no_plugin_maps") && !exists("no_mail_maps")
	"
        map <buffer> <silent> <LocalLeader>P :call BuildPPPReport()<CR>
endif

source ~/.vim/plugin/DateFunctions.vim

" **************************************************
" File Reading Functions
" **************************************************

" FileNameForDate( date, file_type )
" a:date is a hash like the ones generated by GetDateAsDictionary.
" a:file_type is the extension desired for the file without the dot.
function! FileNameForDate( date, file_type )
        let file_format = '%s/%04d/%02d/%04d%02d%02d.%s'
        let filename = printf( file_format, s:worklog_dir, a:date['year'], a:date['month'], a:date['year'], a:date['month'], a:date['day'], a:file_type )
        return simplify( filename )
endfunction

" ReportFileNameForDate( date )
" Returns filenames for Report files
function! ReportFileNameForDate( date )
	return FileNameForDate( a:date, 'report' )
endfunction

" PPPFileNameForDate( date )
" Returns filenames for PPP files
function! PPPFileNameForDate( date )
	return FileNameForDate( a:date, 'ppp' )
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

" **************************************************
" Report-Generation Functions
" **************************************************
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

" PPP() (the main function) 
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

" **************************************************
" BuildPPPReport()
" Build a PPP Report on a new buffer
" **************************************************
function! BuildPPPReport()
	call append( 0, PPP() )
endfunction

" EOF
