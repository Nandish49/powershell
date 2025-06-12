# Create Resource Group
$rg = "MyResourceGroup"
$location = "EastUS"
New-AzResourceGroup -Name $rg -Location $location

# Create VM config
$vmName = "MyPsVM"
$cred = Get-Credential -Message "Enter credentials for VM"
New-AzVM `
    -ResourceGroupName $rg `
    -Name $vmName `
    -Location $location `
    -VirtualNetworkName "$vmName-vnet" `
    -SubnetName "$vmName-subnet" `
    -SecurityGroupName "$vmName-nsg" `
    -PublicIpAddressName "$vmName-ip" `
    -OpenPorts 22 `
    -Credential $cred
