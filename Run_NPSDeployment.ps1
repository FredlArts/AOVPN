Connect-AzureRmAccount

Select-AzureRmSubscription -SubscriptionName "AGRANA EA-NE_163"

New-AzureRmResourceGroup -Name AOVPN-Test -Location "West Europe"

New-AzureRmResourceGroupDeployment -Name new-RASVMSet -ResourceGroupName AOVPN-Test -TemplateUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-RASVMSet.json

New-AzureRmResourceGroupDeployment -Name new-RASVMNSG -ResourceGroupName AOVPN-Test -TemplateUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-RASVMNSG.json -TemplateParameterFile https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-RASVMNSGParam.json

New-AzureRmResourceGroupDeployment -Name new-NPSVMSet -ResourceGroupName AOVPN-Test -TemplateUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-NPSVMSet.json -TemplateParameterFile https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-NPSVMSetParam.json