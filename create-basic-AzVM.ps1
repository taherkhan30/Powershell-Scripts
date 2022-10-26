# this will create Standard_D2s_v3

#create vm 1 
$rg = "myResourceGroup"
$vnet = "myVnet"
$subnet = "mySubnet"
$vmname = "myVM1"

New-AzVm `
    -ResourceGroupName $rg `
    -Name $vmname  `
    -Location "East US" `
    -VirtualNetworkName $vnet `
    -SubnetName $subnet
    -SecurityGroupName "myNetworkSecurityGroup" `
    -PublicIpAddressName "myPublicIpAddress" `
    -OpenPorts 80,3389

    Set-AzVMExtension -ResourceGroupName $rg `
    -ExtensionName "IIS" `
    -VMName $vmname `
    -Location "EastUS" `
    -Publisher Microsoft.Compute `
    -ExtensionType CustomScriptExtension `
    -TypeHandlerVersion 1.8 `
    -SettingString '{"commandToExecute":"powershell Add-WindowsFeature Web-Server; powershell Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"}'

#create vm 2 

New-AzVm `
-ResourceGroupName "myResourceGroupAutomate" `
-Name "myVM" `
-Location "East US" `
-VirtualNetworkName "myVnet" `
-SubnetName "mySubnet" `
-SecurityGroupName "myNetworkSecurityGroup" `
-PublicIpAddressName "myPublicIpAddress" `
-OpenPorts 80, 3389  `
-Credential $cred

    Get-AzPublicIpAddress -ResourceGroupName "myResourceGroup" | Select "IpAddress"

    mstsc /v:publicIpAddress

    mstsc /v:20.121.216.63

    Get-AzRemoteDesktopFile -ResourceGroupName "myResourceGroup" -Name "myVM" -Launch

    Install-WindowsFeature -name Web-Server -IncludeManagementTools

    Remove-AzResourceGroup -Name myResourceGroup

    $cred = Get-Credential

    Get-AzPublicIPAddress `
    -ResourceGroupName "myResourceGroupAutomate" `
    -Name "myPublicIPAddress" | select IpAddress

