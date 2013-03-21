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
map <F8> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeShowBookmarks = 1
colorscheme desert256
filetype plugin indent on
" haskell autocomplete
let g:neocomplcache_enable_at_startup = 1
let g:acp_enableAtStartup = 0
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_camel_case_completion = 1 
"let g:neocomplcache_enable_underbar_completion = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 

let $PATH=$PATH."/usr/bin/"."/home/chemist/.cabal/bin/"
let erlang_folding = 1
au BufEnter *.hs compiler ghc
let g:haddock_indexfiledir = "/home/chemist/.vim/"
let g:haddock_browser="/usr/bin/elinks"
let g:haddock_browser_callformat = '%s -remote "openURL(%s)" '
au BufEnter *.hs map <F12> _?
au BufNewFile,BufRead *.yaml,*.yml    setf yaml

let g:jsbeautify_engine = "node"
let g:htmlbeautify = {'indent_size': 2, 'indent_char': ' ', 'max_char': 78, 'brace_style': 'expand', 'unformatted': ['a', 'sub', 'sup', 'b', 'i', 'u']}
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  " for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  "     " for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" set locallleader
let maplocalleader = "-"
map <F11> -cc 
" bind <F3> for send buffer
au BufEnter *.hs map <F2> :w<cr>-cb
" bind <F4> for send visual
map <F4> -cv

au FileType haskell nnoremap <buffer> ,t :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> ,i :HdevtoolsInfo<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

let g:cumino_ghci_args = "-XOverloadedStrings"
let g:cumino_default_terminal = "urxvt"

let g:tagbar_ctags_bin = "~/.cabal/bin/lushtags"
let g:tagbar_type_haskell = {
    \ 'ctagsbin' : '~/.cabal/bin/lushtags',
    \ 'ctagsargs' : '--ignore-parse-error --',
    \ 'kinds' : [
        \ 'm:module:0',
        \ 'e:exports:1',
        \ 'i:imports:1',
        \ 't:declarations:0',
        \ 'd:declarations:1',
        \ 'n:declarations:1',
        \ 'f:functions:0',
        \ 'c:constructors:0'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'd' : 'data',
        \ 'n' : 'newtype',
        \ 'c' : 'constructor',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'data' : 'd',
        \ 'newtype' : 'n',
        \ 'constructor' : 'c',
        \ 'type' : 't'
    \ }
\ }

au FileType haskell nnoremap <silent> ,, :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
"python


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
