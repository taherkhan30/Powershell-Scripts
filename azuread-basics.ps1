Install-Module AzureAD
Import-Module AzureAD
get-module
get-command -Module AzureAD
get-azaduser
Get-AzureADGroup

$AzureAdCred = Get-Credential
Connect-AzureAD -Credential $cred

Connect-AzureAD 

$tenant=Get-AzureADTenantDetail

get-module
Get-AzureADUser
get-command -module AzureAD

Get-AzureADServicePrincipal 
Get-AzureADServicePrincipalCreatedObject
Get-AzureADServicePrincipalKeyCredential 

the az ad module 
# https://docs.microsoft.com/en-us/powershell/module/az.resources/?view=azps-5.4.0#active-directory
get-azaduser

$sp = Get-AzADServicePrincipal

$sp.displayname
$spnames = $sp.ServicePrincipalNames 

Get-AzADSpCredential -serviceprincipalname ""

$spnames

Get-AzADSpCredential -serviceprincipalname "http://handsonaksSP-20210115223600"
Get-AzADSpCredential -serviceprincipalname "https://VisualStudio/SPN565ee8dc-8c40-49f0-85ea-b7a80fc67097"

   $spcred | get-member

   $spcred.Enddate



#terraform 

   $test = get-azadapplication -ObjectId <id> | get-member
  
$test.ApplicationId | gm







docs 

#https://docs.microsoft.com/en-us/powershell/module/azuread/?view=azureadps-2.0