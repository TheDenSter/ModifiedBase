# load variables
. '.\PowerShell\Settings.ps1'

Create-AlProjectFolderFromBcContainer `
    -containerName $ContainerName `
    -alProjectFolder $BaseAppPath `
    -useBaseAppProperties ` # copies properties from your container into your app.json and launch.json
    -credential $Credential 
