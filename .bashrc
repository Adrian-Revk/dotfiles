# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#===PATH===#
PATH=/home/red/.script:/usr/local/bin:$PATH

# Cursor moving speed
xset r rate 150 20

#===COLORS===#
	BLANC='\[\033[37m\]'
	VERT='\[\033[32m\]'
	VIOLET='\[\033[35m\]'
	CYAN='\[\033[36m\]'
	GRAS='\[\033[01m\]'
	NORM='\[\033[00m\]'
	NOIR='\[\033[30m\]'
	JAUNE='\[\033[33m\]'
#===========#

#===SHELL===#
function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}


export PS1="\[$(tput setaf 1)\]┌─╼ \[$(tput setaf 2)\][\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼\"; else echo \"\[$(tput setaf 1)\]└╼\"; fi) \[$(tput setaf 2)\]"
#export PS1="$NOIR» ${JAUNE}rev${NOIR}${GRAS}╺─╸($NORM$JAUNE\W$NOIR$GRAS)$NORM$CYAN\$(parse_git_branch)  $NORM"
#export PS1="$BLANC($VERT\w$BLANC)\$(parse_git_branch)$NORM "

setterm -blength 0

#===ALIASES===#
	#===BASE===#
		alias s='sudo'
		alias cdC='cd /mnt/C'
		alias cdData='cd /mnt/Data'
		alias cddev='cd /mnt/Data/dev'
		alias ls='ls --color=auto'
		alias la='ls -a'
		alias ll='ls -lh'
		alias lla='ls -lha'
		alias cp='sudo cp -vi'
	        alias rmr='rm -r'
		alias cpr='sudo cp -rvi'
		alias skdir='sudo mkdir'
		alias md='mkdir'
		alias mv='sudo mv -vi'
		alias snano='sudo nano'
		alias ps='ps U revk -o "| %p | " -orss -o " | %a"  --sort rss'
		alias vi='vim'
		alias svi='sudo vim'
		alias ed='gedit'
		alias ..='cd ..'
		alias ...='cd ../..'
		alias ....='cd ../../..'
		alias cl='clear'
		alias kill='kill -9'

        alias reboot='sudo reboot'
        alias halt='sudo halt'

	#===SCREEN==#
		alias screenrad='screen -raAd'
		alias screenls='screen -ls'

	#===TMUX==#
        alias tmux='tmux -2'
        alias tmuxls='tmux list-sessions'
        alias tmuxrad='tmux -2 attach -t'

	#===PERSO===#
		alias mine='sudo chown -hR revk:revk'
		alias proc='ps | grep -i'
		alias mntiso='sudo mount -o loop -t iso9660'
		alias wall='feh --bg-scale'

	#===EMERGE===#
		alias em='sudo emerge -va'
		alias emupdate='sudo eix-sync'
		alias emupgrade='sudo emerge -avuND'
		alias emuses='equery uses'
		alias emrm='sudo emerge -avc'
		alias emclean='sudo eclean'

    #===APTITUDE===#
        alias aptin='sudo apt-get install'
        alias aptrm='sudo apt-get remove'
        alias aptsrc='apt-cache search'
        alias aptupdate='sudo apt-get update'
        alias aptupgrade='sudo apt-get upgrade'
        alias aptdupgrade='sudo apt-get dist-upgrade'

	#===PACMAN===#
		alias pacupdate='yaourt -Sy'
		alias pacupgrade='yaourt -Syu'
		alias pacin='yaourt -S'
		alias pacsrc='yaourt'
		alias pacrm='yaourt -R'
		#alias pacclear='sudo apt-get clean; sudo apt-get autoremove'
		alias pacobsolete='sudo pacman-color -Qdt'

    #===GIT===#
        alias gitlog='git log --graph --decorate'
                
	#===SERVER===#
		#alias alcheckout='svn co https://alzor.svn.sourceforge.net/svnroot/alzor /home/oox/Dev/C++/alzor'
		#alias alupdate='svn update /home/oox/Dev/C++/alzor'
		#alias alcommit='svn ci /home/oox/Dev/C++/alzor'
        
#===FONCTIONS===#
    #Cree un script bash avec le nom donné en argument
	function nscript(){
		if [ -z $1 ]
		then
			echo "La commande nécessite un paramètre"
		else
			echo "#!/bin/bash" > $1
			echo "#  $1" >> $1
			echo "#" >> $1
			echo "" >> $1
			chmod +x $1
			mine $1
			echo "Script $1 crée"
		fi

	}

    #Simple compilation fichier .c passé en parametre
	function compil(){
		if [ -z $1 ]
		then
			echo "La commande nécessite un fichier en C à compiler"
		else
			gcc $1.c -o $1.e
			echo "Executable $1 crée"
		fi
	}

    #Reminder
    #exemple: remindme 10 "pizza!"
    function remindme(){
        sleep $1 && zenity --info --text "$2" &
    }

    #Extractor X
    extract (){
      if [ -f $1 ] ; then
        case $1 in
          *.tar.bz2)   tar xjf $1   ;;
          *.tar.gz)    tar xzf $1   ;;
		  *.tar.xz)	   tar -Jxf $1	;;
          *.bz2)       bunzip2 $1   ;;
          *.rar)       rar x $1     ;;
          *.gz)        gunzip $1    ;;
          *.tar)       tar xf $1    ;;
          *.tbz2)      tar xjf $1   ;;
          *.tgz)       tar xzf $1   ;;
          *.zip)       unzip $1     ;;
          *.Z)         uncompress $1;;
          *.7z)        7z x $1      ;;
          *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
      else
        echo "'$1' is not a valid file"
      fi
    }

    #Archiver Arch
    roll (){
	  if [ -n $2 ]; then
	  	  echo "usage : roll fichier type"
	  else
      	if [ -f $1 ] ; then
          FILE=$1
		  TYPE=$2
          case $TYPE in
            *.tar.bz2) shift && tar cjf $FILE $* ;;
            *.tar.gz) shift && tar czf $FILE $* ;;
            *.tgz) shift && tar czf $FILE $* ;;
            *.zip) shift && zip $FILE $* ;;
            *.rar) shift && rar $FILE $* ;;
			*) 
          esac
      	else
          echo "'$1' is not a valid file"
      	fi
	  fi
    }

    # Color man pages
    man() {
        env \
            LESS_TERMCAP_mb=$(printf "\e[1;31m") \
            LESS_TERMCAP_md=$(printf "\e[1;31m") \
            LESS_TERMCAP_me=$(printf "\e[0m") \
            LESS_TERMCAP_se=$(printf "\e[0m") \
            LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
            LESS_TERMCAP_ue=$(printf "\e[0m") \
            LESS_TERMCAP_us=$(printf "\e[1;32m") \
                man "$@"
    }



export EDITOR=vim
export SVN_EDITOR=vim
export LD_LIBRARY_PATH=.

#export LANGUAGE=en_US.UTF-8
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8

if [ -n "$DISPLAY" ]; then
     BROWSER=chromium
fi
export PATH=~/bin:$PATH
