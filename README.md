# misc-ps1
These are just some miscellaneous Powershell Scripts to automate some frequently recurring tasks that I don't deem large enough to warrant their own projects.

# fixMappedDrives.ps1

Will prompt in-shell for Domain, Username, and Password, then use those credentials to unmap/remap every mapped drive on the system. If you are using mapped drives from multiple domains/usernames/accounts, then this script does not handle that. Maybe it will someday but right now, it's just for basic resets if things get stuck.

# pinglog.ps1

Pings Cloudflare's DNS server until the process gets killed, outputting to C:\pinglog.txt with timestamps. Very crude and just a simple tool to quickly set up a basic monitor for network drops. Don't expect anything robust.