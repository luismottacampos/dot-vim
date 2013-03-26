" Syntax Definitions for Status Report Files
" Author: Luis Motta Campos <lucampos@ebay.com>

syntax clear
syntax case match

" Formatting
highlight status_report_header guifg=Black gui=bold,underline
highlight status_report_asterisk guifg=Blue gui=bold
highlight status_report_platform_tag guifg=SeaGreen
highlight status_report_manager_tag guifg=DarkGreen
highlight status_report_lmc_tag guifg=Red guibg=Yellow
highlight status_report_todo_item guifg=Blue gui=bold
highlight status_report_ticket_id guifg=DarkBlue gui=bold,underline
highlight status_report_url guifg=SeaGreen gui=bold,underline
highlight status_report_server gui=bold,underline
highlight problem_tag guibg=Yellow guifg=Red gui=bold,underline

" Syntax Definitions
syntax match status_report_header 'DBA Activity Report 20[012][0-9]-\(0[1-9]\|1[012]\)-\(0[1-9]\|[12][0-9]\|3[01]\) (\w\+\, [A-Z]\{2\})'
syntax match status_report_asterisk '^\*'
syntax match status_report_manager_tag '\[\(Armand\|Milton\|Joseph\|David\|Jilles\|Jing\|ALL\)\]'
syntax match status_report_platform_tag '\[\(AM\|AU\|CA\|EA\|EK\|GT\|KI\|KJ\|LQ\|MP\|NOC\|PO\|DW\|CORE\)\]'
syntax match status_report_lmc_tag '\[LMC\]'
syntax match problem_tag '\[PROBLEM\]'
syntax match status_report_ticket_id '([A-Z]\+-[0-9]\+)'
syntax match status_report_todo_item '(TODO)'
syntax match status_report_url 'https\{0,1\}:\/\/[A-Za-z0-9_\.\/\~\-\+]\+'
syntax match status_report_server '[a-z][a-z]\-[a-z]\+[0-9]\+'

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
