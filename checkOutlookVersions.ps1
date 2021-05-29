# This is just default path to Exchange 2010 RPC logs. Change it to match your Exchange version.
$logpath = 'C:\Program Files\Microsoft\Exchange Server\V14\Logging\RPC Client Access'

# We limit the amount of logs by timeframe. This is to get more current view.
$files = Get-ChildItem $logpath |Where-Object {$_.LastWriteTime -ge (Get-Date).AddDays(-15)}

# Now, let's get the logs.
$logs = $files | ForEach {Get-Content $_.FullName}| Where-Object {$_ -notlike '#*'}

# We covert the data to PowerShell objects
$result = $logs |ConvertFrom-Csv -Header date-time,session-id,seq-number,client-name,organization-info,client-software,client-software-version,client-mode,client-ip,server-ip,protocol,application-id,operation,rpc-status,processing-time,operation-specific,failures

# And finally we filter the client information  and group it by version number.
$result | Where-Object {$_.'client-software' -eq 'OUTLOOK.EXE'}|group client-software-version

