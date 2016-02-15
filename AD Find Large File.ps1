$User = Read-host -Prompt 'Enter Username'
$Machinename = Read-Host -Prompt 'Enter Server Name'
$Session = New-PSSession -computername $Machinename -credential domain01\$User
$Runme = gci -path 'f:\' -r | sort Length -desc | select-object @{Name='SizeGB';Expression={ "{0:N2}" -f ($_.Length / 1GB) }},fullname -f 20

Invoke-command -session $Session -scriptblock $Runme

Exit-PSSession
