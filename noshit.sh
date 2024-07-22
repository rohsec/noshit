#!/bin/bash

################# LOGO ####################
logo(){
printf """                  _     _ _        (   ) 
                 | |   (_) |    (   ) (
  _ __   ___  ___| |__  _| |_    ) _   )
 | '_ \ / _ \/ __| '_ \| | __|     ( \_
 | | | | (_) \__ \ | | | | |_    _(_\ \)__
 |_| |_|\___/|___/_| |_|_|\__|  (____\___))     
 ${yellow}===========${bred} @rohsec${yellow} ========${reset}"""
}

################### CONSTANTS #######################
extlist=".(jpeg|jpg|png|woff|woff2|ttf|mp4|mp3|svg|eot|css|otf|txt|gif|avi|mov|wmv|mkv|wav|ogg|webm|ico)"
stringlist=""
silent=false
bred='\033[1;31m'
bblue='\033[1;34m'
yellow='\033[0;33m'
reset='\033[0m'
red='\033[0;31m'
blue='\033[0;34m'
################# USAGE ######################
usage(){
logo
printf """\n
A simple wrapper around grep with predifiened filters to remove shit out of your wayback output

Flags:
	-e : additional extension filter
	-s : additional string filter
	-q : Quite mode

Example Usage:                                                               

[*] To use default filters
        cat urls.txt|noshit

[*] To specify additional blacklist extension
        cat urls.txt|noshit -e 'php|js|txt'

[*] To filter output via additional string
	cat urls.txt|noshit -s 'string1|string2'

[*] Quite mode, suitable to pipe output to another tool
	cat urls.txt|noshit -q -e 'php|jsp' -s 'assets|static'

"""
}


################# CORE FUNCTION ####################
filter(){

if [ ! -t 0 ]; then
      if $silent; then 
	      [[ ! -z $stringlist ]] && (cat - | egrep -iv "$extlist|$stringlist"|sort -u) || (cat -| egrep -iv "$extlist"|sort -u)	   
     else
	logo	  
	     [[ ! -z $stringlist ]] && (printf "\n\n${blue}Ext filters: ${yellow}[$red$extlist$yellow]\n${blue}String filters: ${yellow}[$red$stringlist$yellow]$reset\n\n" ;cat - | egrep -iv "$extlist|$stringlist"|sort -u) || (printf "\n\n$blueExt filters: $yellow[$red$extlist$yellow]$reset\n\n";cat - | egrep -iv "$extlist"|sort -u)
      
      fi 

else
 usage	

fi

#if $silent; then
#
#	if [ ! -z $stringlist ];then	
#	[[ ! -t 0 ]] && (printf "\n\n${blue}Ext filters: ${yellow}[$red$extlist$yellow]\n${blue}String filters: ${yellow}[$red$stringlist$yellow]$reset\n\n" ;cat - | egrep -iv "$extlist|$stringlist") || usage
#else
#	[[ ! -t 0 ]] && (printf "\n\nExt filters: [$extlist]\n\n";cat - | egrep -iv "$extlist") || usage
#	[[ ! -t 0 ]] && (printf "\n\nExt filters: [$extlist]\n\n";cat - | egrep -iv "$extlist") || usage
#fi
#fi
}

################# SCRIPT START #######################
while getopts "e:s:qh" opt;do
	case $opt in
		e) 
			extlist="${extlist::-1}|$OPTARG)"
			;;
		s)
			stringlist="$OPTARG"
			;;
		q) silent=true
			;;
		h) 
			usage
			exit 0
			;;
		\?) 
			usage 
			exit 1;
			;;
		:) 
			usage 
			exit 1;
			;;
		esac
	done
	filter
