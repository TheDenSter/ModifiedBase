# This is not necessary if you use the -useCleanDatabase when you create your container

# first, enter the container:
Enter-BCContainer mysandbox

# then, run the two functions, which loads them into memory
function UnpublishAppAndDependencies($ServerInstance, $ApplicationName)
{
     Get-NAVAppInfo -ServerInstance $ServerInstance | Where-Object { 
    # If the dependencies of this extension include the application that we want to unpublish, it means we have to unpublish this application first.
    (Get-NavAppInfo -ServerInstance $ServerInstance -Name $_.Name).Dependencies | Where-Object {$_.Name -eq $ApplicationName}
 } | ForEach-Object {
    UnpublishAppAndDependencies $ServerInstance $_.Name
 }

 Unpublish-NavApp -ServerInstance $ServerInstance -Name $ApplicationName
}

function UninstallAndUnpublish($ServerInstance, $ApplicationName)
{
    Uninstall-NavApp -ServerInstance $ServerInstance -Name $ApplicationName -Force
    UnpublishAppAndDependencies $ServerInstance  $ApplicationName

}

# to run the actual Cmdlet:
UninstallAndUnpublish -ServerInstance BC -ApplicationName "Base Application"
