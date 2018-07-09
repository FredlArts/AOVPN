Connect-AzureRmAccount

Select-AzureRmSubscription -SubscriptionName "AGRANA EA-NE_163"

New-AzureRmResourceGroup -Name AOVPN-Test -Location "West Europe"

New-AzureRmResourceGroupDeployment -Name ExampleDeployment -ResourceGroupName AOVPN-Test -TemplateUri https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-NPSVMSet.json -TemplateParameterFile https://raw.githubusercontent.com/fredlarts/AOVPN/master/new-NPSVMSetParam.json