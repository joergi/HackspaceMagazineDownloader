
# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/Hackspace-Magazine-Downloader
#          downloader for all Hackspace Magazine issues
#          they are downloadable for free under: https://hackspace.raspberrypi.org/issues
#          or you can buy the paper issues under: https://store.rpipress.cc/collections/all/hackspace-magazine?sort_by=created-descending
#          this script is under GNU GENERAL PUBLIC LICENSE
#          The idea is based on my MagPi Downloader - 
#          but MagPi downloader for windows was programmed by rubemlrm - https://github.com/joergi/MagPiDownloader
#
# ------------------------------------------------------------------


Param(
    [string]$f,
    [string]$l
)

# control variables
$i=1
$issues=1
$baseUrl="https://s3-eu-west-1.amazonaws.com/rpi-magazines/issues/full_pdfs/000/000/007/original/HackSpaceMag01.pdf"
$web = New-Object system.net.webclient
$errorCount = 0
# Check if directory dont exist and try create
if( -Not (Test-Path -Path "issues" ) )
{
    New-Item -ItemType directory -Path "issues"
}

#check last command executation
if(-Not $f) {
    #start scrapping directory and download files
    $l = (Invoke-WebRequest -Uri $baseUrl -usebasicparsing).Links

    ($web.downloadstring($baseUrl) -split "<a\s+") | %{
        [void]($_ -match "^href=[`'`"]([^`'`">\s]*)");
        if ($matches.Length -gt 0) {
        $file = $matches[1]
            if( $file -match 'HackSpaceMag[0-9]+\.pdf') {
                try
                {
                    Write-Host $env:appdata
                    $fileUrl = $baseUrl + "/" + $file
                    Write-Host $fileUrl
                    $web.DownloadFile($fileUrl, "$PSScriptRoot\issues\" + $file)
                } Catch
                {
                    Write-Host "Ocorred an error trying download " + $file
                    $errorCount++
                }
            }
        }
    }
} else {

    if ($f) {
        $i = [int]$f
    }

    if ($l) {
        $issues = [int]$l
    }

    do{
        $filePattern = "";
        if ($i -lt 10) {
            $filePattern = "HackSpaceMag0$i.pdf"
        } else {
            $filePattern = "HackSpaceMag$i.pdf"
        }

        try {
            Write-Host Downloading $filePattern
            $fileUrl = $baseUrl + "/" + $filePattern
            $web.DownloadFile($fileUrl, "$PSScriptRoot\issues\" + $filePattern)
        }
        Catch {
            Write-Host "Ocorred an error trying download " + $filePattern
            $errorCount++;
        }

        $i++
     } While($i -le $issues)
}

if ($errorCount -gt 0) {
	exit 1
}
