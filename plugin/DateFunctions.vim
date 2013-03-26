" **************************************************
" Date Generation Functions
" **************************************************

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
