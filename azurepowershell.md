Introduction 

- extension of windows powershell 
- az ps is a set of cmslets for managing azure resources directly from the ps command line 

install az module 

get-installedmodules 
Install-Module -Name az -AllowClobber -Force 
import-module 
set-executionpolicy bypass 

connect-azaccount -subscription ''

select-azsubscription -subscriptionid ''

select-azsubscription -subscriptionname '' 

get-azresourcegroup 

