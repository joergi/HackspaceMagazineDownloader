 #!/bin/bash
# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/WireframeDownloader
#          downloader for all Wireframe magzine issues and books
#          based on Magpi Downloader: https://github.com/joergi/MagpiDownloader
#          they are downloadable for free under https://wireframe.raspberrypi.org/issues
#          or you can buy the paper issues under: https://store.rpipress.cc/collections/wireframe
#          this script is under GNU GENERAL PUBLIC LICENSE 3
# ------------------------------------------------------------------

# VERSION=0.2.0
# USAGE="Usage: bash hackspace-books-downloader.sh [-f firstissue] [-l lastissue]"

OUTDIR=special-issues

if [ ! -d "$OUTDIR" ]; then
 mkdir "$OUTDIR"
fi


file="special-editions.txt"
while IFS= read -r line
do
	bash <(curl https://raw.githubusercontent.com/joergi/downloader/0.4.3/linux_mac/downloader.sh) "$line" "$OUTDIR"
done < "$file"

exit 0
