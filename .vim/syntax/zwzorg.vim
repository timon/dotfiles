"if exists("b:current_syntax")
"  finish
"endif

syn match orgTag '\[[^]]*\][[:space:]]' contained display

" Comment: ## ...
syn match orgComment '^##.*$'
" TBD: >> ..., > ...
syn match orgTodo    '^>> .*$' contains=orgTag
syn match orgTodo    '^> .*$' contains=orgTag
" Maybe: ? ...
syn match orgMaybe   '^? .*$'   contains=orgTag
" Done:ss* ...
syn match orgDone    '^+ .*$'  contains=orgTag
" Done, but was not planned:ss*+ ...
syn match orgExtraDone '^[+][+] .*$' contains=orgTag,orgTime
" Not done/miss
syn match orgNoResult '^[-–] .*$' contains=orgTag

" This goes into report: ** [commit or url]
syn match orgReportableResult	 '^[*][*] .*$'
" This is aux step completed: *+ ...
syn match orgLocalResult '^[*][+] .*$'

syn match orgTime '\d\d:\d\d'
syn match orgDate '^\d\d\.\d\d\.\d\d.*$'

let b:current_syntax = "zwzorg"
hi def link orgReportableResult Type
hi def link orgDone Type
hi def link orgLocalResult LineNr
hi def link orgComment Comment
hi def link orgExtraDone Type
hi def link orgDate Search
hi def link orgTime Identifier
hi def link orgTag Identifier
hi def link orgNoResult WarningMsg
hi def link orgTodo	Constant
