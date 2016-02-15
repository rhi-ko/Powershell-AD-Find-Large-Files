$User = Read-host -Prompt 'Enter Username'
$Serverq = Read-Host -Prompt 'Enter Server Name'
$Session = New-PSSession -computername $Serverq -credential domain01\$User
$runme = gci -path 'f:\' -r | sort Length -desc | select-object @{Name='SizeGB';Expression={ "{0:N2}" -f ($_.Length / 1GB) }},fullname -f 20

Invoke-command -session $session -scriptblock $Runme

Exit-PSSession
