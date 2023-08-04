#!/bin/bash
set -o errexit
#set -o pipefail ## it's failing for line 82 + 86 in downloader
set -o nounset
IFS=$'\n\t'

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

downloadUrl="https://hackspace.raspberrypi.com/issues/%02d/pdf/download"
file="issues.txt";
recentIssue=$(cat "$file");

# workaround for a known limitation in bash 3.x: http://lists.gnu.org/archive/html/bug-bash/2006-01/msg00018.html
# stackoverflow: https://stackoverflow.com/questions/32596123/why-source-command-doesnt-work-with-process-substitution-in-bash-3-2/32596626#32596626
# shellcheck disable=SC1091
source /dev/stdin <<<"$(curl -s https://raw.githubusercontent.com/joergi/downloader/0.4.6/linux_mac/downloader.sh)" "$downloadUrl" "$OUTDIR" "$recentIssue" HS_ "$@"

exit 0


