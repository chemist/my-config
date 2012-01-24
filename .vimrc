set t_Co=88
colorscheme desert256
filetype plugin indent on
autocmd Filetype scm source ~/.vim/ftplugin/SchemeMode.vim
map <F9> :!rebar compile<CR>
au BufRead,BufNewFile *.zconf set filetype=zconf
