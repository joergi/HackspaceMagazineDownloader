[![HitCount](http://hits.dwyl.com/joergi/Hackspace-Magazine-Downloader.svg)](http://hits.dwyl.com/joergi/Hackspace-Magazine-Downloader) ![TestScripts](https://github.com/joergi/HackspaceMagazineDownloader/workflows/TestScripts/badge.svg)


# Hackspace-Magazine-Downloader for Windows, Mac OS and Linux
A downloader for the free Hackspace magazine - https://hackspace.raspberrypi.org/


# Hackspace-Magazine-Downloader for Windows
Downloads all the Hackspace issues on Windows

Open your Powershell as Administrator (right click on PowerShell -> Open as Administrator)
Enter: `set-executionpolicy remotesigned`
and you are able to use the Powershell scripts.
All Windows scripts are done by [github user Rubemlrm](https://github.com/Rubemlrm)


  `git clone https://github.com/joergi/Hackspace-Magazine-Downloader.git`

Download the normal issues:
  `./windows-downloader.ps1`

Download a specific range of normal issues:
  `./windows-downloader.ps1 -f 1 -l 1`

# Hackspace-Magazine-Downloader on Linux or Mac OS

Downloads all the Mag Pi issues (a Raspberry Pi magazine) on Linux and Mac OS

  `git clone https://github.com/joergi/Hackspace-Magazine-Downloader.git`   

Download the normal issues:  
  `./hackspace-downloader.sh`

Download a specific range of normal issues:
  `./hackspace-downloader.sh -f 1 -l 1`
