# USAGE="Usage: windows-downloader.sh [-f firstissue] [-l lastissue]"

<#
.SYNOPSIS
    Downloader for all Hackspace issues
.DESCRIPTION
     they are downloadable for free under: https://hackspace.raspberrypi.org/issues
     or you can buy the paper issues under: https://store.rpipress.cc/collections/all/hackspace-magazine?sort_by=created-descending
     this script is under GNU GENERAL PUBLIC LICENSE

.NOTES
    This script is under GNU GENERAL PUBLIC LICENSE
    Orignal author: Rubemlrm - https://github.com/Rubemlrm
    The new rewritten code is copied from The Magpi Windows code by [Author](https://github.com/Jaykul)
    Script is part of https://github.com/joergi/Hackspace-Magazine-Downloader
#>
    [CmdletBinding()]
param(
    [string]$FirstIssue = "1",
    [string]$LastIssue
)
[uri]$baseUrl = "https://hackspace.raspberrypi.com/issues/"

# control variables
$baseDir = Split-Path -Path $PSScriptRoot -Parent
if (!$LastIssue) {
    $LastIssue = Get-Content "$baseDir\HackspaceMagazineDownloader\issues.txt" -First 1
}

$downloadDir = Join-Path $baseDir "issues"

# Check if directory dont exist and try create
if (!(Test-Path -Path $downloadDir)) {
    $null = New-Item -ItemType Directory -Path $downloadDir -ErrorAction Stop
}

$errorCount = 0
foreach($issue in $FirstIssue..$LastIssue) {
    $uri = [uri]::new($baseurl,"{0:00}/pdf" -f $issue)
    Write-Verbose -Message "Downloading $uri"
    if (($link = (Invoke-WebRequest -UseBasicParsing $uri).Links.Where{ $_.class -eq "c-link" }.href)) {
        $uri = [uri]::new($baseurl, $link)
        try {
            Write-Information "Downloading $uri"
            Write-Output "Downloading $uri"
            Invoke-WebRequest $uri -OutFile (Join-Path $downloadDir $uri.Segments[-1]) -ErrorAction Stop
            Write-Verbose -Message "Downloaded $uri"
        } catch {
            Write-Warning "Failed downloading $uri"
            Get-Error | Out-String | Write-Verbose -Verbose
            $errorCount++
        }
    } else {
        Write-Warning "Failed to find link for issue $issue"
        $errorCount++
    }
}

if ($errorCount -gt 0) {
    exit 1
}
