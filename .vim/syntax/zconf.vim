" Vim syntax file
" Language: zconf file
" Maintainer: chemist chemistmail@gmail.com
" Last change: 2011 Sep 29


syntax sync fromstart
syntax case match

syn keyword zconfStatement url network host auth hostgroup template item trigger templatemon function httpregexp httpsimple
syn keyword zconfStatement tcp process memory
syn region array start=/,\s*\[/ end=/\]/ contains=zconfStatement,bracket,item,fun
syn region bracket start=/{/ end=/}\./ contains=zconfStatement,array,item,fun,temp
syn region item start=/{item/ end=/}/ contains=zconfStatement,array 
syn region fun start=/{function/ end=/}/ contains=zconfStatement,item
syn match zconfComment "%.*$"

highlight link zconfStatement Statement
highlight link temp Statement
highlight link zconfComment Comment
highlight link array Function
highlight link bracket Special
highlight link item Question
highlight link fun ModeMsg
highlight link templatename ModeMsg
" The default methods for highlighting. Can be overridden later

let b:current_syntax = 'zconf'
