let s:bcs = b:current_syntax

unlet b:current_syntax
syntax include @SQL syntax/mysql.vim
syntax cluster SQL remove=mysqlComment

"unlet b:current_syntax
"syntax include @RUBY syntax/ruby.vim

let b:current_syntax = s:bcs
"match optional, surrounding single or double quote and any whitespace in the heredoc name
syntax region rubyHereDocSQL matchgroup=Statement start=+<<[-~]\?SQL+ end=+^\s*SQL$+ contains=@SQL,@rubyNotTop
syntax region rubyHereDocRuby matchgroup=Statement start=+<<[-~]\?RUBY+ end=+^\s*RUBY$+ contains=ALL
