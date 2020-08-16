Connect-AzAccount
Select-AzSubscription -Subscription "Rahul-subscription"
##Get-AzLocation | Select location

##variables
$ResourcegroupName = "RG-PS-0814"
$ResourcegroupLocation = "eastus"
$StorageAccountName = "rahulsaps0815"


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


##Storage Account Creation


$SA = Get-AzStorageAccount -Name $StorageAccountName -ResourceGroupName $RG.ResourceGroupName -ErrorAction SilentlyContinue

if(!$SA){
$SA = New-AzStorageAccount -Name $StorageAccountName -ResourceGroupName $RG.ResourceGroupName -Location $ResourcegroupLocation -SkuName Standard_LRS -AccessTier Hot
Write-Host "Storage Account created"
Write-Host $SA.StorageAccountName
Write-Host $RG.Location
}

else{
Write-Host "Storage Account already exists"
}