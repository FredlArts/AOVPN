Connect-AzureRmAccount

Select-AzureRmSubscription -SubscriptionName "AGRANA EA-NE_163"

New-AzureRmResourceGroup -Name "AZWE_AOVPN" -Location "West Europe"

New-AzureRmResourceGroupDeployment -Name new-RASVMNSG -ResourceGroupName AZWE_AOVPN -TemplateUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-RASVMNSG.JSON -TemplateParameterUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-RASVMNSGParam.json

New-AzureRmResourceGroupDeployment -Name new-RASVMSet -ResourceGroupName AZWE_AOVPN -TemplateUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-RASVMSet.json -TemplateParameterUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-RASVMSetParam.json

New-AzureRmResourceGroupDeployment -Name new-NPSVMSet -ResourceGroupName AZWE_AOVPN -TemplateUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-NPSVMSet.json -TemplateParameterUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-NPSVMSetParam.json
