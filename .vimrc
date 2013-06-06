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
au BufEnter *.go map <F9> :!go build<CR>
au BufEnter *.go map <F10> :!./go<CR>
map <F8> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeShowBookmarks = 1
colorscheme desert256
"colorscheme pablo
"
filetype plugin indent on

" haskell autocomplete
" cabal install ghc-mod
let g:neocomplcache_enable_at_startup = 1
let g:acp_enableAtStartup = 0
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>" 

let $PATH = $PATH . ':' . expand("~/.cabal/bin")
let $PATH = $PATH . ':' . expand("~/.ghc-7.6.3/bin")
let erlang_folding = 1
let g:haddock_indexfiledir = "/home/chemist/.vim/"
let g:haddock_browser="/usr/bin/elinks"
let g:haddock_browser_callformat = '%s -remote "openURL(%s)" '

"hoogle
autocmd FileType haskell map ,h :HoogleDoc()<cr>
autocmd FileType haskell map ,c :Hlint()<cr>
" VIM-haskell
"au BufEnter *.hs compiler ghc
"au FileType haskell map <buffer> ,h _?
"au FileType haskell map <buffer> ,o _?1

au BufNewFile,BufRead *.yaml,*.yml    setf yaml

let g:jsbeautify_engine = "node"
let g:htmlbeautify = {'indent_size': 2, 'indent_char': ' ', 'max_char': 78, 'brace_style': 'expand', 'unformatted': ['a', 'sub', 'sup', 'b', 'i', 'u']}
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
  " for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
  "     " for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" cabal install stylish-haskell
" ctrl - f for stylish
autocmd FileType haskell noremap <buffer> <c-f> :call StylishHaskell()<cr>

" cabal install hdevtools
" settings for hdevtools
let g:hdevtools_options = '-g -isrc'
au FileType haskell nnoremap <buffer> ,t :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> ,i :HdevtoolsInfo<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

" cabal install lushtags
" settings for lushtags
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
