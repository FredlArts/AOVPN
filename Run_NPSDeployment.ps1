Connect-AzureRmAccount

Select-AzureRmSubscription -SubscriptionName "AGRANA EA-NE_163"

New-AzureRmResourceGroup -Name AOVPN-Test -Location "West Europe"

New-AzureRmResourceGroupDeployment -Name new-NPSVMSet -ResourceGroupName AOVPN-Test -TemplateUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-NPSVMSet.json -TemplateParameterUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-NPSVMSetParam.json

New-AzureRmResourceGroupDeployment -Name new-RASVMNSG -ResourceGroupName AOVPN-Test -TemplateUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-RASVMNSG.JSON -TemplateParameterUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-RASVMNSGParam.json