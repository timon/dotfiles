set nocompatible
source ~/.vim/bundles.vim
if &term =~ "xterm" || &term =~ "screen"
  set t_Co=256
endif


set sw=2 ts=2 et tw=78 wm=2 sm showcmd
set number

autocmd FileType ruby setlocal sw=2 ts=2 expandtab
autocmd FileType yaml setlocal sw=2 ts=2 expandtab list
autocmd FileType javascript setlocal sw=2 ts=2 expandtab iskeyword=@,48-57,_,-,192-255,$
autocmd FileType c    setlocal sw=4 sw=4 noet
autocmd FileType css,scss setlocal sw=2 ts=2 et list iskeyword=@,48-57,_,-,192-255,$
autocmd FileType python setlocal sw=4 ts=4 et
au BufNewFile,BufRead *.sql set ft=mysql ts=2 sw=2 et
au BufNewFile,BufRead *.rhtml,*.html,*.shtml,*.htm,*.php,*.rb,*.erb setlocal sw=2 ts=2 expandtab
au BufNewFile,BufRead *.js.sample set ft=javascript sw=2 ts=2 et
au FileType javascript let jshint2_save = 1
au FileType zwzorg setlocal tw=0 nowrap
au FileType zwzorg let b:SuperTabEnabled = 0
au FileType markdown setlocal spelllang=ru,en
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1

autocmd FileType gitcommit setlocal fo-=n

au BufNewFile,BufRead *.md setlocal ft=markdown tw=78 fo=trq
au BufNewFile,BufRead *.hbs set ft=mustache

au FileType gitcommit setlocal fo-=an

set cindent
filetype plugin indent on
if has("gui_running")
	resize 138 64
	set co=134
	set lines=64
	set ch=3
endif
set guioptions-=T
let c_space_errors=1
let g:netrw_browse_split=1
let g:netrw_alto=1
let g:treeExplVertical=1
let g:treeExplDirSort=1
let g:treeExplWinSize=40
syn on
set encoding=utf8
if has("gui_gtk2") || has("gui_gtk3")
	" Won't work, will use the first font
	" See :help 'guifont'
	set guifont=Go\ Mono\ 9,\ Liberation\ Mono\ 7,\ Inconsolata\ Medium\ 11
elseif has("gui_mac") || has("gui_macvim")
	set guifont=Go\ Mono:h12,Monaco:h12
endif
set foldmethod=indent background=dark foldlevel=3
set backspace=eol,start,indent
set cinoptions=(s,us,l1
set comments=sr:/*,mb:*,ex:*/
set statusline=%<%f\ %y\ %h%m%r\ [%{&fenc},\ %{&ff}]%=0x%B\ %-14.(%c,%l/%L%V%)\ %P
set laststatus=2
set formatoptions=tcrqo
set incsearch
hi Constant ctermfg=cyan
hi Comment ctermfg=brown
hi Keyword ctermfg=white
hi Repeat  ctermfg=white
hi Operator ctermfg=white
hi Statement ctermfg=white
hi Conditional ctermfg=white
hi Include ctermfg=green
hi PreCondit ctermfg=green
hi PreProc ctermfg=green
hi Structure ctermfg=white
hi StorageClass ctermfg=yellow
hi Type ctermfg=cyan
hi link localWhitespaceError Error
colorscheme darkblue
hi Normal ctermbg=darkblue
hi Folded ctermbg=darkblue
hi Search ctermbg=12 cterm=NONE ctermfg=NONE
hi IncSearch ctermbg=12 cterm=NONE ctermfg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi CursorLine term=NONE cterm=NONE ctermbg=NONE cterm=underline
hi CursorLineNr term=NONE cterm=NONE ctermbg=12
hi Numeric ctermfg=cyan
hi Float ctermfg=cyan
hi orgLocalResult ctermfg=darkgreen guifg=darkgreen
hi SpecialKey ctermfg=darkcyan term=NONE guifg=#2233ff
hi GitGutterAdd guifg=green ctermfg=10
hi GitGutterDelete guifg=red ctermfg=12
au Syntax * syn match localWhitespaceError /\(\zs\%#\|\s\)\+$/
au Syntax * syn match localWhitespaceError / \+\ze\t/
set modeline
set cursorline hls
set path+=/opt/local/include
set wildmode=list:longest
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>
inoremap <S-CR> <C-O>O
nnoremap Y y$

let g:SuperTabNoCompleteAfter = ['^', '\s', '[,)}*]']
let g:ruby_indent_assignment_style = 'variable'

set backupdir=/var/tmp/vim,.
set directory=/var/tmp/vim,.
set mouse=a

set noea

set listchars=tab:‣∙,trail:∙,extends:>,precedes:<,nbsp:◦
set colorcolumn=80
set list

inoremap <// </<C-x><C-o>
nnoremap <leader>' :nohls<CR>
nnoremap <leader>t :GFiles<CR>
nmap t :Files<CR>

if has("gui_gtk2") || has("gui_gtk3")
  " vim 8 has broken gx:
  " https://vi.stackexchange.com/a/22505
  nnoremap gx :!xdg-open <cWORD> &<CR><CR>
else
  nnoremap gx :!open <cWORD> &<CR><CR>
endif

let g:gitgutter_max_signs = 200  " default value

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

set diffopt+=vertical

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

set completeopt=menuone,longest,preview,noselect

set scrolloff=8

" Only run linters named in ale_linters settings.
" let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop']
\}
let g:ale_set_loclist = 1
"let g:ale_set_quickfix = 1
"let g:ale_open_list = 0
"
"let g:ale_javascript_eslint_executable='yarn run eslint'
"let g:ale_ruby_rubocop_executable='rbenv exec rubocop'
let g:ale_ruby_rubocop_executable='bundle exec rubocop'

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '💩'
let g:ale_sign_style_error = '💩'
let g:ale_sign_style_warning = '⁉️'
let g:ale_sign_info = '❕'

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

set ignorecase smartcase
