new-pssession -computername $c 

$c = read-host -Prompt 'Name of server'

Invoke-Command -Computername $c -Credential $cred -ScriptBlock { gci -path 'c:\' -r  | sort Length -desc | select @{Name='SizeGB';Expression={ "{0:N2}" -f ($_.Length / 1GB) }},fullname -f 20 | out-string}

Get-pssession -Computername $c | Remove-Pssession
