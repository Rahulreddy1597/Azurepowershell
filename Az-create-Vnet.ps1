Connect-AzAccount
Select-AzSubscription -Subscription "Rahul-subscription"
##Get-AzLocation | Select location

##variables
$ResourcegroupName = "RG-PS-0814"
$ResourcegroupLocation = "eastus"
$VnetName = "Vnet-PS-1"
$AddressSpace = "10.0.0.0/27"
$SubnetName = "Subnet-PS-A"
$SubnetSpace = "10.0.0.0/28"

##Resource group Creation
$RG = Get-AzResourceGroup -Name $ResourcegroupName -Location $ResourcegroupLocation -ErrorAction SilentlyContinue

if(!$RG){
$RG = New-AzResourceGroup -Name $ResourcegroupName -Location $ResourcegroupLocation 
Write-Host "Resource group created"
Write-Host $RG.ResourceGroupName
Write-Host $RG.Location
}

else{
Write-Host "Resource Group already exists"
Write-Host $RG.ResourceGroupName
Write-Host $RG.Location
}


##Creating Vnet
$Vnet = Get-AzVirtualNetwork -Name $VnetName -ResourceGroupName $RG.ResourceGroupName -ErrorAction SilentlyContinue
if(!$Vnet){
$Vnet = New-AzVirtualNetwork -Name $VnetName -ResourceGroupName $RG.ResourceGroupName -Location $RG.Location -AddressPrefix $AddressSpace
Write-Host "VNET Created"
Write-Host $Vnet.Name
Write-Host $Vnet.Location
}

else{
Write-Host "VNET already exists / Unable to create VNET"
}


##Creating Subnet
$Vnet = Get-AzVirtualNetwork -Name $VnetName -ResourceGroupName $RG.ResourceGroupName -ErrorAction SilentlyContinue

if(!($Vnet.SubnetsText.Contains($SubnetName))){
$Snet = Add-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $Vnet -AddressPrefix $SubnetSpace 
}

else{
Write-Host "Subnet can't be created"
}

Set-AzVirtualNetwork -VirtualNetwork $Vnet

