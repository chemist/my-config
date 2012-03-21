" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim
call pathogen#infect()

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!


set tabstop=4
set shiftwidth=4
set foldcolumn=1
set expandtab
set nowrap
set showmatch
syntax on

au BufEnter *.erl map <F9> :!rebar compile<CR>
au BufEnter *.hs map <F9> :make<CR>
map <F8> :NERDTree<CR>
map <F7> :NERDTreeClose<CR>
colorscheme desert256
filetype plugin indent on
" haskell autocomplete
let g:neocomplcache_enable_at_startup = 1
let g:acp_enableAtStartup = 0
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_camel_case_completion = 1 
"let g:neocomplcache_enable_underbar_completion = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 

let $PATH=$PATH."/usr/bin/"
let erlang_folding = 1
au BufEnter *.hs compiler ghc
let g:haddock_indexfiledir = "/home/chemist/.vim/"
let g:haddock_browser="/usr/bin/elinks"
let g:haddock_browser_callformat = '%s -remote "openURL(%s)" '
au BufEnter *.hs map <F12> _?


map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
