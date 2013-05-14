# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile_zsh
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chemist/.zshrc'

autoload -Uz compinit
compinit 
# End of lines added by compinstall
#autoload colors zsh/terminfo; colors # Подгружаем цветовые карты
autoload colors && colors # Подгружаем цветовые карты
#PROMPT="%{$fg[green]%}%B%m %{$fg[blue]%}%~ %(!,#,$)%b %{$reset_color%}"
PROMPT="%{$fg_bold[blue]%} %~ %{$fg_bold[magenta]%}-%(!.#.$) %{$reset_color%}"                                                 
RPROMPT="%{$fg_bold[grey]%}%m@%n %{$reset_color%}% %(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%}"
bindkey -v
#setopt NUMERIC_GLOB_SORT
#setopt MULTIBYTE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt histexpiredupsfirst histfindnodups
setopt longlistjobs
#export TERM=xterm-256color # problem with tmux and mc
export TERM=xterm-color

# Распаковка любого архива (http://muhas.ru/?p=55)
unpack() {
if [ -f $1 ] ; then
case $1 in
	*.tar.bz2)   tar xjf $1        ;;
	*.tar.gz)    tar xzf $1     ;;
	*.bz2)       bunzip2 $1       ;;
	*.rar)       unrar x $1     ;;
	*.gz)        gunzip $1     ;;
	*.tar)       tar xf $1        ;;
	*.tbz2)      tar xjf $1      ;;
	*.tgz)       tar xzf $1       ;;
	*.zip)       unzip $1     ;;
	*.Z)         uncompress $1  ;;
	*.7z)        7z x $1    ;;
	*)           echo "Cannot unpack '$1'..." ;;
esac
else
echo "'$1' is not a valid file"
fi
}

# ... и упаковка (http://muhas.ru/?p=55)
pack() {
if [ $1 ] ; then
case $1 in
	tbz)   	tar cjvf $2.tar.bz2 $2      ;;
	tgz)   	tar czvf $2.tar.gz  $2   	;;
	tar)  	tar cpvf $2.tar  $2       ;;
	bz2)	bzip $2 ;;
	gz)		gzip -c -9 -n $2 > $2.gz ;;
	zip)   	zip -r $2.zip $2   ;;
	7z)    	7z a $2.7z $2    ;;
	*)     	echo "'$1' Cannot be packed via pack()" ;;
esac
else
echo "'$1' is not a valid file"
fi
}

slovar () (        
# http://code.google.com/p/dict-lookup-chrome-ext/source/browse/trunk/extension/lookup.js
# http://www.google.com/dictionary?langpair=en|ru&q=chemist&hl=ru&aq=f
# http://www.zsh.org/mla/users/2006/msg00063.html 
#
	 GET "http://www.google.com/dictionary?langpair=en|ru&q=$(</dev/stdin)&hl=ru&aq=f" | grep dct-tt | sed /'class=\"dct-e/d' | sed '/<a\ href/d' | sed 's/<span class="dct-tt">//g' |sed 's/<\/span>//' | sed '/<span /d' | head -n $1 
)    

slovarvim () (        
# http://code.google.com/p/dict-lookup-chrome-ext/source/browse/trunk/extension/lookup.js
# http://www.google.com/dictionary?langpair=en|ru&q=chemist&hl=ru&aq=f
# http://www.zsh.org/mla/users/2006/msg00063.html 
#
	 GET "http://www.google.com/dictionary?langpair=en|ru&q=$1&hl=ru&aq=f" | grep dct-tt | sed /'class=\"dct-e/d' | sed '/<a\ href/d' | sed 's/<span class="dct-tt">//g' |sed 's/<\/span>//' | sed '/<span /d' | head -n 3
)    

konsole-on () (
 qdbus `qdbus | grep konsole` /konsole/MainWindow_1  setVisible 1
 qdbus `qdbus | grep konsole` /konsole/MainWindow_1 showFullScreen
 qdbus `qdbus | grep konsole` /konsole/MainWindow_1 setFocus
)
konsole-off () (
 qdbus `qdbus | grep konsole` /konsole/MainWindow_1  setVisible 0
)

konsole-full () (
 ps -C konsole --no-heading || /usr/bin/konsole 
 qdbus `qdbus | grep konsole` /konsole/MainWindow_1 Get com.trolltech.Qt.QWidget visible \
 | grep -q true && konsole-off || konsole-on
)

alias ls='ls --color=auto'
alias s='dvtm '
alias grep='grep --color=auto'
alias clearx='sudo kill -USR1 `ps -C X -o pid=`'


export PATH=/home/chemist/.haskell/bin/:$PATH:/home/chemist/.cabal/bin/:~/develop/go/.gocode/bin
export GOPATH=~/develop/go/.gocode

	bindkey "^[[H" beginning-of-line
	bindkey "^[[F" end-of-line


book-iconv () {                 
  if [ -f $1 ] ; then
   grep -q windows-1251 $1 &&  iconv -f cp1251 -t utf8 $1 | sed 's/cp1251/UTF-8/' | sed 's/windows-1251/UTF-8/' > u$1
  fi
}

run_microphone () {
   ps au | grep -v grep | grep -q arecord && killall arecord || arecord -F 5 -D hw:1,0 -t wav -f dat -c 1 | lame - > ~/microphone/`date +%F-%R`.mp3 &
}
zle -N run_microphone run_microphone
bindkey "^[[24~" run_microphone


alias git-help='cat ~/.git-help'

