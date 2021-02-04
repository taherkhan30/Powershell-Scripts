Connect-AzAccount

##Install Azure Az Module 


## Check status of the VM 

$ResourceGroupName = "TaherKhan"

$Vmname = "tknbs"

$VMstatus = Get-AzVm -ResourceGroupName $ResourceGroupName -name $Vmname -Status 

if ($VMstatus.Statuses[1].code -eq "powerstate/deallocated") {

    $newVMstatus = Start-AzVM -ResourceGroupName $ResourceGroupName  -Name $Vmname
    
    Write-Host "VM Starting" -NoNewline

}elseif ($VMstatus.Statuses[0].code -eq "ProvisioningState/succeeded") {

    Write-Host "The" $Vmname  "is already on" 
}
