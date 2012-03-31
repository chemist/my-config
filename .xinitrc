keychain ~/.ssh/id_rsa
[ -f ~/.keychain/$HOSTNAME-sh ] && . ~/.keychain/$HOSTNAME-sh 2>/dev/null
xsetroot -cursor_name left_ptr
xset b off
unclutter &
exec xmonad
