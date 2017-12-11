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
# USAGE="Usage: sh linux-downloader.sh"


if [ ! -d "hackspace_issues" ]; then
 mkdir hackspace_issues
fi

#1
wget https://s3-eu-west-1.amazonaws.com/rpi-magazines/issues/full_pdfs/000/000/007/original/HackSpaceMag01.pdf -P hackspace_issues/

