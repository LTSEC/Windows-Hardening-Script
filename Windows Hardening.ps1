#Install-PackageProvider -Name "NuGet" -MinimumVersion "2.8.5.201" -Force
#Install-Module PSWindowsUpdate -Force
#Import-Module ActiveDirectory

#Get-Command -Module PSWindowsUpdate
#$updates = Get-WindowsUpdate

#$maxDownload = "500MB"
#$downloadList = @()
#$downloadListSize = 0

#$updates.Title

#$downloadList[0]
#ForEach($e in $downloadList){echo $e.Size}

#$list = C:\Users\Administrator\Desktop\user.txt

#download smaller windows service patches


#download autorun, procmon

#List of URLs for tools to install
$urls = @("https://download.sysinternals.com/files/SysinternalsSuite.zip")

#Grabs the filepath for the desktop
$path = [Environment]::GetFolderPath("Desktop") + "\START FOLDER"

#Create the start folder
$startFolder = New-Item -Path $path -ItemType Directory

#Download each of the files from the URLs array
ForEach($url in $urls)
{
   #Invoke-RestMethod -Uri $url -OutFile $path\$(Split-Path -Path $url -Leaf)
}

$zipFolders = Get-ChildItem -Path $path -Filter *.zip 
echo $zipFolders
ForEach($zip in $zipFolders){
    echo $zip
    $noExt = [System.IO.Path]::GetFileNameWithoutExtension($zip)
    #Expand-Archive -Path $path\$zip -DestinationPath $path\$noExt
}
#Remove-Item -Path $path -Filter *.zip -Recurse -Force -Confirm:$false
#Get-ChildItem -Path $path\"SysinternalsSuite" -Filter "PsExec*" | Remove-Item

#create group
#create group policies
#disable rdp, remote shell, camera

#block ports 5000 and up
$portList = @(22, 80, 5900)
ForEach($port in $portList)
{
    echo "Blocking port: $port"
    New-NetFirewallRule -DisplayName "Block Inbound Port $port" -Direction Inbound -LocalPort $port -Protocol TCP -Action Block 
}

#disable guest & old login accounts
net user guest /active:no

#ForEach-Object -Process {}