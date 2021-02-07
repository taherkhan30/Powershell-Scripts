

- extension of windows powershell 
- az ps is a set of cmslets for managing azure resources directly from the ps command line 

install az module 

get-installedmodules 
Install-Module -Name az -AllowClobber -Force 
import-module 
set-executionpolicy bypass 

connect-azaccount -subscription ''

select-azsubscription -subscriptionid ''

Select-AzSubscription -Subscription 'aa07614d-2c55-4e18-84ca-108abaaa6fcd'  

select-azsubscription -subscriptionname '' 

get-azresourcegroup 


<b>useful docs </b>
https://docs.microsoft.com/en-us/powershell/azure/?view=azps-5.4.0

module documentation 
https://docs.microsoft.com/en-us/powershell/module/?view=azps-5.4.0