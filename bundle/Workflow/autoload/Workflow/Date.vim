" **************************************************
" Date Generation Functions
" **************************************************

" Simple days-to-seconds conversion function
function! Workflow#Date#DaysToSeconds( days )
        return 86400 * a:days 
endfunction

" Returns the unixtimestamp of a day <days_ago> from now
function! Workflow#Date#GetUnixTimeFrom( days_ago )
        return localtime() - Workflow#Date#DaysToSeconds( a:days_ago )
endfunction

" Produces a dictionary with keys "year", "month", "day", "week", maybe for
" <days_ago> days in the past.
function! Workflow#Date#GetDateAsDictionary( days_ago )
        let tmp_date = split( strftime( '%Y %m %d %W', Workflow#Date#GetUnixTimeFrom( a:days_ago ) ) )
        let date = { 'year': tmp_date[0], 'month': tmp_date[1], 'day': tmp_date[2], 'week': tmp_date[3] }
        return date
endfunction

" This file is part of the Work Journal VIM Extension
" 
" The Work Journal VIM Extension is free software: you can redistribute it
" and/or modify it under the terms of the GNU General Public License as
" published by the Free Software Foundation, either version 3 of the License,
" or (at your option) any later version.
" 
" The Work Journal VIM Extension is distributed in the hope that it will be
" useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
" Public License for more details.
" 
" You should have received a copy of the GNU General Public License along with
" the Work Journal VIM Extension.  If not, see <http://www.gnu.org/licenses/>.
