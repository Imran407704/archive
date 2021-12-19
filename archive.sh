#!/bin/bash

#Color
Cyan="\e[0;49;36m"

#Banner
echo -e "${Cyan}
                       _      _             
     /\               | |    (_)            
    /  \    _ __  ___ | |__   _ __   __ ___ 
   / /\ \  | '__|/ __|| '_ \ | |\ \ / // _ |
  / ____ \ | |  | (__ | | | || | \ V /|  __/
 /_/    \_\|_|   \___||_| |_||_|  \_/  \___|
                                                                                       
     @imran407704 aka CyberSecOpS
                                      
Get All the URLS From Waybackurls, Gau, Gau-Plus

${STOP}"

domain=$1

if [ $# -lt 1 ]; then
    echo "+---------------------------------------+"
    echo "|  Usage: ./`basename $0` <target.tld> 	|" 
    echo "|  Eg:    ./archive.sh google.com       |"
    echo "+---------------------------------------+"
    exit 1
fi


if [ "$1" == "-h" ] ; then
    echo "This is Help Menu"
    echo 
    echo "+---------------------------------------+"
    echo "|  Usage: ./`basename $0` <target.tld> 	|" 
    echo "|  Eg:    ./archive.sh google.com       |"
    echo "+---------------------------------------+"
    exit 0
fi

archive(){
echo "Directory Is Creating"
mkdir -p archive 
echo "Directory is Created"
echo "Get all urls is Starting "
gau --o archive/gau.txt $domain
echo "GAU IS COMPLETED"
echo "WayBack is Starting"
echo "$domain" | waybackurls > archive/waybackurls.txt
echo "WAYBACKURLS IS COMPLETED"
echo "Gau-Plus is Starting"
gauplus $domain > archive/plus_gau.txt 
echo "GAU-PLUS IS COMPLETED"
cat archive/gau.txt archive/waybackurls.txt archive/plus_gau.txt > archive/allfiles.txt
cat archive/allfiles.txt | sort -u > archive/uniq-files.txt

echo "Done :)"
}
archive

