# Prompts for network credentials, then grabs all mapped drives and iterates over them, deleting then readding them.
# For network drives that get unmapped on bad VPN connections.

$dom = Read-Host "Enter your domain"
$user = Read-Host "Enter your username"
$pw = Read-Host "Enter your password" -AsSecureString
$cred = New-Object System.Management.Automation.PSCredential ("$dom\$user", $pw)

Get-WmiObject -Class Win32_MappedLogicalDisk | ForEach-Object {
	net use $_.Name /delete
	$provider = $_.ProviderName
	Start-Sleep 3
	New-PSDrive -Name $_.Name.SubString(0, 1) -PSProvider FileSystem -Credential $cred -Root $provider -Persist -Scope Global
}