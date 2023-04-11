# Simple script- Will ping 1.1.1.1 constantly and output timestamp + results into a text file at the root.
# Made for testing network connections on devices with frequent dropouts.

filter timestamp {"$(Get-Date -UFormat %Y-%m-%d-%T): $_"}
ping -t 1.1.1.1 | timestamp | Out-File -FilePath C:\pinglog.txt