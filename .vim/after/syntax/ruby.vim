"  let s:bcs = b:current_syntax
"  unlet b:current_syntax
"  syntax include @SQL syntax/mysql.vim
"  " syntax include @RUBY syntax/ruby.vim
"  let b:current_syntax = s:bcs
"  " match optional, surrounding single or double quote and any whitespace in the heredoc name
"  syntax region rubyHereDocSQL matchgroup=String start=+<<-\?SQL+ end=+^\s*SQL$+ contains=@SQL,@rubyInterpolation
"  syntax region rubyHereDocRuby matchgroup=String start=+<<-\?RUBY+ end=+^\s*RUBY$+ contains=ALLBUT,@rubyNotTop
"  
"  hi link rubyHereDocSQL rubyHeredoc
"  hi link rubyHereDocRuby rubyHeredoc
