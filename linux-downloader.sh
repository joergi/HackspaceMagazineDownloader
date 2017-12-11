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
issues=1

if [ -z $1 ]
then
	wget https://s3-eu-west-1.amazonaws.com/rpi-magazines/issues/full_pdfs/000/000/007/original/ \
	--recursive \
	--no-directories \
	--no-parent \
	--directory-prefix issues \
	--mirror \
	--accept-regex "/HackSpaceMag[0-9]+\.pdf" \
	--reject index.html \
	--execute robots=off

else

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
		if [ "$i" -lt 10 ]; then
			wget https://s3-eu-west-1.amazonaws.com/rpi-magazines/issues/full_pdfs/000/000/007/original/HackSpaceMag0$i.pdf -P issues/

		else
			wget https://s3-eu-west-1.amazonaws.com/rpi-magazines/issues/full_pdfs/000/000/007/original/HackSpaceMag$i.pdf -P issues/
		fi
		i=$(( i+1 ))
	done

fi



