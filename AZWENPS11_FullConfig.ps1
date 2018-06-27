Configuration AZWENPS11_FullConfig
{
$LocalInstallPath = Get-AutomationVariable -Name "LocalInstallPath"
$AZWENPS11_ConfigSAS = Get-AutomationVariable -Name "AZWENPS11_ConfigSAS"
$AZWERASClient1 = Get-AutomationVariable -Name "AZWERASClient1"


Import-DscResource -ModuleName xPSDesiredStateConfiguration
    

    Node NPSnode11
    {        
        xRemoteFile NPSConfig 
        {
        Uri = $AZWENPS11_ConfigSAS
        DestinationPath = $LocalInstallPath + "azwnps11.xml"
        }

        WindowsFeature NPAS
        {
        Ensure = "Present"
        Name = "NPAS"
        IncludeAllSubFeature = $true
        }

        WindowsFeature RSATNPAS
        {
        Ensure = "Present"
        Name = "RSAT-NPAS"
        DependsOn = "[WindowsFeature]NPAS"
        }

        Script RunNPSScript 
        {
             TestScript = 
             {
                $res = Get-NpsRadiusClient | where { $_.Name -eq $AZWERASClient1 }
                If($res)
                {
                    $value = $true
                }
                else
                {
                    $value = $false
                }
                return $value
             }

             SetScript = 
             {
                Import-NpsConfiguration -Path 'C:\Install\azwnps11.xml'
             }

             GetScript = 
             {
                @{Result = (Get-Content c:\install\azwnps11.xml)}
             }
        }
    }
}