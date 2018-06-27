Configuration AZWENPS12_FullConfig
{
$LocalInstallPath = Get-AutomationVariable -Name "LocalInstallPath"
$AZWENPS12_ConfigSAS = Get-AutomationVariable -Name "AZWENPS12_ConfigSAS"
$AZWERASClient2 = Get-AutomationVariable -Name "AZWERASClient2"


Import-DscResource -ModuleName xPSDesiredStateConfiguration
    

    Node NPSnode12
    {        
        xRemoteFile NPSConfig 
        {
        Uri = $AZWENPS12_ConfigSAS
        DestinationPath = $LocalInstallPath + "azwnps12.xml"
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
                $res = Get-NpsRadiusClient | where { $_.Name -eq $AZWERASClient2 }
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
                Import-NpsConfiguration -Path 'C:\Install\azwnps12.xml'
             }

             GetScript = 
             {
                @{Result = (Get-Content c:\install\azwnps12.xml)}
             }
        }
    }

}