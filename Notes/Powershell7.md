useful resources 

- https://channel9.msdn.com/Shows/IT-Ops-Talk/OPS117-PowerShell-Deep-Dive

Basic info 
- Cross Platform 


Install PS 7 

<code> iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI" </code> 

Secret Management Module 

install-module Microsoft.Powershell.SecretStore
reset-secret-vault 
get-command -Module Microsoft.Powershell.SecretManagement
