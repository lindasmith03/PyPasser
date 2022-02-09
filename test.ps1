net user $Env:Username Mark@123
$IEESC = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
Set-ItemProperty -Path $IEESC -Name “IsInstalled” -Value 0
Stop-Process -Name Explorer

$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object    System.Net.WebClient).DownloadFile('https://dl.dropboxusercontent.com/s/ijbwdt1qbmgg1cx/Google_Chrome_%2864bit%29_v61.0.3163.100.exe?dl=0', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)
start chrome https://drive.google.com/folderview?id=1LhK2a8MzCSRmtIxWbqZcQFpolA0J5vDl

$dlurl = 'https://7-zip.org/' + (Invoke-WebRequest -Uri 'https://7-zip.org/' | Select-Object -ExpandProperty Links | Where-Object {($_.innerHTML -eq 'Download') -and ($_.href -like "a/*") -and ($_.href -like "*-x64.exe")} | Select-Object -First 1 | Select-Object -ExpandProperty href)
$installerPath = Join-Path $env:TEMP (Split-Path $dlurl -Leaf)
Invoke-WebRequest $dlurl -OutFile $installerPath
Start-Process -FilePath $installerPath -Args "/S" -Verb RunAs -Wait
Remove-Item $installerPath

$Url = "https://github.com/markrdp03ob/markrdpob/raw/main/Openbullet.zip"
$DownloadZipFile = "C:\Users\Public" + $(Split-Path -Path $Url -Leaf)
$ExtractPath = [Environment]::GetFolderPath("Desktop")
Invoke-WebRequest -Uri $Url -OutFile $DownloadZipFile
$ExtractShell = New-Object -ComObject Shell.Application 
$ExtractFiles = $ExtractShell.Namespace($DownloadZipFile).Items() 
$ExtractShell.NameSpace($ExtractPath).CopyHere($ExtractFiles)
$Urld = "https://github.com/markrdp03ob/markrdpob/raw/main/chromedriver.exe"
$Downloaddriver = '~/desktop/Openbullet u passt/bin/chromedriver.exe'
Invoke-WebRequest -Uri $Urld -OutFile $Downloaddriver
$Chrome = "${env:ProgramFiles(x86)}\Google\Update\GoogleUpdate.exe";
If(Test-Path($Chrome)){Rename-Item -Path $Chrome -NewName "Old_GoogleUpdate.exe.old" -Force};

$Chrome = "$env:ProgramFiles\Google\Update\GoogleUpdate.exe";
If(Test-Path($Chrome)){Rename-Item -Path $Chrome -NewName "Old_GoogleUpdate.exe.old" -Force};
$GUpdateServices = (Get-Service | ?{$_.DisplayName -match "Google Update Service"}).Name;
$GUpdateServices | % {
    $status = (Get-Service -Name $_).Status;
    If($status -ne "Stopped"){Stop-Service $_ -Force};
    $sType  = (Get-Service -Name $_).StartType;
    If($sType -ne "Disabled"){Set-Service $_ -StartupType Disabled};
    };
Rename-Item -Path "C:\Program Files (x86)\Google\Update\GoogleUpdate.exe" -NewName "C:\Program Files (x86)\Google\Update\GoogleUsfspdate.exe"
cd 'C:\Program Files (x86)\Google\Update\1.3.33.5'
remove-item "*.exe*"
cd '~/desktop/Openbullet u passt'
.\Openbullet.exe

$GUdateTasks = (Get-ScheduledTask -TaskPath "\" -TaskName "*GoogleUpdateTask*");
$GUdateTasks | % {If($_.State -ne "Disabled"){Disable-ScheduledTask -TaskName $_.TaskName}};