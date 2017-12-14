push-location
Set-Location HKLM:\SYSTEM\CurrentControlSet\Policies\Microsoft\FVE
Set-ItemProperty . RDVDenyWriteAccess "0"
Pop-Location