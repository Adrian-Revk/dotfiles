# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#===PATH===#
export PATH=~/bin:$PATH

# Cursor moving speed
xset r rate 150 20

#===SHELL===#
function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ [\1$(parse_git_dirty)]/"
}

export PS1='\[$(tput setaf 9)\]\u\[$(tput setaf 1)\] :: \[$(tput setaf 9)\]\w\[$(tput setaf 1)\]$(parse_git_branch)\[$(tput sgr0)\] '

#===ALIASES===#
	#===BASE===#
		alias s='sudo'
		alias ls='ls --color=auto'
		alias la='ls -a'
		alias ll='ls -lh'
		alias lla='ls -lha'
		alias cp='cp -vi'
	        alias rmr='rm -r'
		alias cpr='cp -rvi'
		alias skdir='sudo mkdir'
		alias md='mkdir'
		alias mv='mv -vi'
		alias snano='sudo nano'
		alias vi='vim'
		alias svi='sudo vim'
		alias ..='cd ..'
		alias ...='cd ../..'
		alias ....='cd ../../..'
		alias cl='clear'
        alias cdDev='cd /mnt/D/Adrien/Development'
        alias cdD='cd /mnt/D'
        alias updatedb='sudo updatedb --prunepaths="/mnt" 2> /dev/null'

	#===SCREEN==#
		alias screenrad='screen -raAd'
		alias screenls='screen -ls'

	#===TMUX==#
        alias tmux='tmux -2'
        alias tmuxls='tmux list-sessions'
        alias tmuxrad='tmux -2 attach -t'

	#===PERSO===#
		alias mine='sudo chown -hR radr:radr'
		alias proc='ps -A | grep -i'
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
        alias aptin='sudo apt install'
        alias aptrm='sudo apt remove'
        alias aptsrc='sudo apt search'
        alias aptupdate='sudo apt update'
        alias aptupgrade='sudo apt upgrade'

	#===PACMAN===#
		#alias pacupdate='yaourt -Sy'
		#alias pacupgrade='yaourt -Syu'
		#alias pacin='yaourt -S'
		#alias pacsrc='yaourt'
		#alias pacrm='yaourt -R'
		#alias pacclear='sudo apt-get clean; sudo apt-get autoremove'
		#alias pacobsolete='sudo pacman-color -Qdt'

    #===GIT===#
        alias gitlog='git log --graph --decorate'
                
        
#===FONCTIONS===#
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
