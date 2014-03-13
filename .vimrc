set nocompatible
source ~/.vim/bundles.vim
if &term =~ "xterm" || &term =~ "screen"
  set t_Co=256
endif

set number sw=4 ts=4 tw=78 wm=2 sm showcmd
autocmd FileType ruby setlocal sw=2 ts=2 expandtab
autocmd FileType javascript setlocal sw=2 ts=2 expandtab
autocmd FileType c    setlocal sw=4 sw=4 noet
autocmd FileType python setlocal sw=4 ts=4 et
au BufNewFile,BufRead *.rhtml,*.html,*.shtml,*.htm,*.php,*.rb,*.erb setlocal sw=2 ts=2 expandtab
set cindent
filetype plugin indent on
if has("gui_running")
	set co=200
	set lines=64
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
set guifont=Liberation\ Mono\ 14,Monaco:12,
set foldmethod=indent background=dark foldlevel=5
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
hi Search ctermbg=12 cterm=none ctermfg=none
hi IncSearch ctermbg=12 cterm=none ctermfg=none
hi SignColumn ctermbg=none
hi CursorLine term=none cterm=none ctermbg=12
hi CursorLineNr term=none cterm=none ctermbg=12
hi Numeric ctermfg=cyan
hi Float ctermfg=cyan
au Syntax * syn match localWhitespaceError /\(\zs\%#\|\s\)\+$/
au Syntax * syn match localWhitespaceError / \+\ze\t/
set modeline
set cursorline hls
set path+=/opt/local/include
imap <M-t> <Esc>:NERDTreeToggle<CR>
nmap <M-t> :NERDTreeToggle<CR>
nmap t :NERDTreeToggle<CR>
set wildmode=list:longest
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>
nnoremap Y y$
let g:syntastic_enable_signs=1

set backupdir=/tmp/vim,.
set directory=/tmp/vim,.
set mouse=a

