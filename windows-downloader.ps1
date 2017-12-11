
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

# Check if directory dont exist and try create
if( -Not (Test-Path -Path "issues" ) )
{
    New-Item -ItemType directory -Path "issues"
}

$issues = @(
    "HackSpaceMag01.pdf
)

$baseUrl="https://s3-eu-west-1.amazonaws.com/rpi-magazines/issues/full_pdfs/000/000/007/original/"
$web = New-Object system.net.webclient
$errorCount = 0
foreach($issue in $issues)
{
      try
                {
                    Write-Host $env:appdata
                    $fileUrl = $baseUrl + "/" + $issue
                    Write-Host $fileUrl
                    $web.DownloadFile($fileUrl, "$PSScriptRoot\issues\\$issue")
                } Catch
                {
                    Write-Host "Ocorred an error trying download " + $file
                    $errorCount++
                }
}

if ($errorCount -gt 0) {
	exit 1
}
