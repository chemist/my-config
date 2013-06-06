

 command! -buffer -nargs=? HoogleDoc call hoogle#doc(<q-args>)
 command! -buffer -nargs=? Hlint call hoogle#hlint()
