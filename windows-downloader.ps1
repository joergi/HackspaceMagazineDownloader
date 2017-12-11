
# Check if directory dont exist and try create
if( -Not (Test-Path -Path "special_issues" ) )
{
    New-Item -ItemType directory -Path "special_issues"
}

$special_issues = @(
    "HackSpaceMag01.pdf
)

$baseUrl="https://s3-eu-west-1.amazonaws.com/rpi-magazines/issues/full_pdfs/000/000/007/original/"
$web = New-Object system.net.webclient
$errorCount = 0
foreach($issue in $special_issues)
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
