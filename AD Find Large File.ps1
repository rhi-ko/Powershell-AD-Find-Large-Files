$c = read-host -Prompt 'Name of server'
$job = start-job -scriptblock { gci -path 'c:\' -r  | sort Length -desc | select @{Name='SizeGB';Expression={ "{0:N3}" -f ($_.Length / 1GB) }},@{Name='Last Modified Date';E={$_.LastWriteTime.ToShortDateString()}},fullname -f 20 } -Credential $cred
$job | Wait-job
Receive-Job $job 
Get-Job | Remove-Job 

new-pssession -computername $c | Enter-pssession


#Invoke-Command -Computername $c -ScriptBlock { gci -path 'c:\' -r  | sort Length -desc |`
# select @{Name='SizeGB';Expression={ "{0:N2}" -f ($_.Length / 1GB) }},fullname -f 20 | out-string} -Credential $cred #-asjob

Get-pssession -Computername $c | Remove-Pssession
