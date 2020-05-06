#!/bin/bash
# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/Hackspace-Magazine-Downloader
#          downloader for all Hackspace Magazine issues
#          they are downloadable for free under: https://hackspace.raspberrypi.org/issues
#          or you can buy the paper issues under: https://store.rpipress.cc/collections/all/hackspace-magazine?sort_by=created-descending
#          this script is under GNU GENERAL PUBLIC LICENSE
#          This scripts are based on my MagPi Downloader https://github.com/joergi/MagPiDownloader
# ------------------------------------------------------------------

# VERSION=0.1.0
# USAGE="Usage: sh linux-downloader.sh [-f firstissue] [-l lastissue]"

if [ ! -d "issues" ]; then
 mkdir issues
fi

i=1
issues=$(cat "issues.txt");


while :
do
	case "$1" in
	-f) shift; i="$1";;
	-l) shift; issues="$1";;
	--) shift; break;;
	-*) usage "bad argument $1";;
	*) break;;
	esac
	shift
done

while [ $i -le $issues ]
do
	printf -v page_url "https://hackspace.raspberrypi.org/issues/%02d/pdf" $i
	pdf_url=`curl -sf $page_url | grep \"c-link\" | sed 's/^.*href=\"//' | sed 's/\?.*$//'`
	wget -N $pdf_url -P issues
	i=$(( i+1 ))
done

exit 0
