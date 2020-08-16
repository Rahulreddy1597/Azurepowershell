Connect-AzAccount
Select-AzSubscription -Subscription "Rahul-subscription"
##Get-AzLocation | Select location

##variables
$ResourcegroupName = "RG-PS-0814"
$ResourcegroupLocation = "eastus"


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

