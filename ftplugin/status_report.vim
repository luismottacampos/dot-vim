" File Type Plugin for the type "status_report" 

" Only do this when not done yet for this buffer
" if exists("b:did_status_report_plugin")
"   finish
" endif
" let b:did_status_report_plugin = 1

" Spell Checking is important and should be always active.
setlocal spell
setlocal spelllang=en_gb

" Add mappings, unless the user didn't want this.
if !exists("no_plugin_maps") && !exists("no_mail_maps")
endif
