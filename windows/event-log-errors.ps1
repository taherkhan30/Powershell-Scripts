Get-EventLog -Logname System -Newest 5 -EntryType Error| Select-Object -Property index,source,message | ConvertTo-HTML | Out-File -FilePath c:\errors.html
