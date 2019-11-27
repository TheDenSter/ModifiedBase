# load variables
. '.\PowerShell\Settings.ps1'

New-NavContainer `
    -accept_eula `
    -containerName $ContainerName `
    -imageName $imageName `
    -licenseFile $licenseFile `
    -auth NavUserPassword `
    -alwaysPull `
    -Credential $Credential `
    -includeAL ` # necessary to create a folder in the container with the DotNet assemblies
    -useCleanDatabase ` # removes Base App and its dependencies from your container
    -updateHosts `
    -additionalParameters @("-e customNavSettings=ExtensionAllowedTargetLevel=OnPrem")

