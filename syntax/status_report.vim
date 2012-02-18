" Syntax Definitions for Status Report Files
" Author: Luis Motta Campos <lucampos@ebay.com>

syntax clear
syntax case match

" Formatting
highlight status_report_header guifg=Black gui=bold,underline
highlight status_report_asterisk guifg=Blue gui=bold
highlight status_report_platform_tag guifg=SeaGreen
highlight status_report_manager_tag guifg=DarkGreen
highlight status_report_todo_item guifg=Blue gui=bold
highlight status_report_ticket_id guifg=DarkBlue gui=bold,underline
highlight status_report_url guifg=SeaGreen gui=bold,underline
highlight status_report_server gui=bold,underline

" Syntax Definitions
syntax match status_report_header 'DBA Activity Report 20[012][0-9]-\(0[1-9]\|1[012]\)-\(0[-19]\|[12][0-9]\|3[01]\) (\w\+\, [A-Z]\{2\})'
syntax match status_report_asterisk '^\*'
syntax match status_report_manager_tag '\[\(Milton\|Joseph\|David\|Garry\|Dave\|Jing\|ALL\)\]'
syntax match status_report_platform_tag '\[\(AM\|AU\|EA\|GT\|KI\|KJ\|MP\|NOC\|PO\|DW\|CORE\)\]'
syntax match status_report_ticket_id '([A-Z]\+-[0-9]\+)'
syntax match status_report_todo_item '(TODO)'
syntax match status_report_url 'https\{0,1\}:\/\/[A-Za-z0-9_\.\/\~\-\+]\+'
syntax match status_report_server '[a-z][a-z]\-[a-z]\+[0-9]\+'
