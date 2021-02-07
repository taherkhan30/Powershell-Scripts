


$rg = Get-AzResourceGroup
Get-AzResourceGroup -Location 'eastus'
Get-AzResourceGroup | where-object {$_.Location -eq 'eastus'} | Format-List 
Get-AzResourceGroup | where-object {$_.Location -eq 'eastus'} | Format-Table -Autosize

Get-AzResourceGroup | where-object {$_.Location -eq'uksouth'} |
    select-object ResourceGroupName, Location, ProvisioningState
    | Format-Table -Autosize
$rg | gm