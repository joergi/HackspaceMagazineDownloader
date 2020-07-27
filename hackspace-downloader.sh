#!/bin/bash
# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/Hackspace-Magazine-Downloader
#          downloader for all Hackspace Magazine issues
#          they are downloadable for free under: https://hackspace.raspberrypi.org/issues
#          or you can buy the paper issues under: https://store.rpipress.cc/collections/all/hackspace-magazine?sort_by=created-descending
#          this script is under GNU GENERAL PUBLIC LICENSE
#          This scripts are based on my MagPi Downloader https://github.com/joergi/MagPiDownloader
# ------------------------------------------------------------------

# VERSION=0.2.0
# USAGE="Usage: sh downloader.sh [-f firstissue] [-l lastissue]"

OUTDIR=issues

if [ ! -d "$OUTDIR" ]; then
 mkdir "$OUTDIR"
fi

downloadUrl="https://hackspace.raspberrypi.org/issues/%02d/pdf"
file="issues.txt";
recentIssue=$(cat "$file");

# shellcheck disable=SC1090
source <(curl -s https://raw.githubusercontent.com/joergi/downloader/main/linux_mac/downloader.sh) "$downloadUrl" "$recentIssue" "$@"

exit 0


