If ((((wmic computersystem get domain) -split "`n")[2]).trim() -eq "WORKGROUP") {
	Write-Host "Computer is not joined to domain. Exiting..." -ForegroundColor "Red"
	Exit 1
}

Invoke-GPUpdate -Force

$Volumes = Get-BitlockerVolume

$WinVolume = $Volumes | Where-Object MountPoint -Like "*C*"

If ($WinVolume.VolumeStatus -like "*FullyDecrypted") {
	Enable-Bitlocker -MountPoint $WinVolume.MountPoint
}
