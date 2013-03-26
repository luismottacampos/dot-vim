" Syntax Definitions for Status Report Files
" Author: Luis Motta Campos <lucampos@ebay.com>

syntax clear
syntax case match

" Formatting
highlight PPP_header guifg=Black gui=bold,underline
highlight PPP_asterisk guifg=Blue gui=bold
highlight PPP_platform_tag guifg=SeaGreen
highlight PPP_manager_tag guifg=DarkGreen
highlight PPP_todo_item guifg=Blue gui=bold
highlight PPP_ticket_id guifg=DarkBlue gui=bold,underline
highlight PPP_url guifg=SeaGreen gui=bold,underline
highlight PPP_server gui=bold,underline
highlight problem_tag guibg=Yellow guifg=Red gui=bold,underline

" Syntax Definitions
syntax match PPP_header 'PPP Week \([01234][0-9]\|5[012]\)\|^Progress\|^Problems\|^Plans'
syntax match PPP_asterisk '^\*'
syntax match PPP_manager_tag '\[\(Armand\|Milton\|Joseph\|David\|Jilles\|Jing\|ALL\)\]'
syntax match PPP_platform_tag '\[\(AM\|AU\|CA\|EA\|EK\|GT\|KI\|KJ\|LQ\|MP\|NOC\|PO\|DW\|CORE\)\]'
syntax match PPP_ticket_id '([A-Z]\+-[0-9]\+)'
syntax match PPP_todo_item '(TODO)'
syntax match PPP_url 'https\{0,1\}:\/\/[A-Za-z0-9_\.\/\~\-\+]\+'
syntax match PPP_server '[a-z][a-z]\-[a-z]\+[0-9]\+'
syntax match problem_tag '\[PROBLEM\]'
