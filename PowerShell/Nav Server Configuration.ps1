# the New-BCContainer script should already have set the right properties

# load variables
. '.\PowerShell\Settings.ps1'

# first, enter the container:
Enter-BCContainer $ContainerName

# to see the current configuration of the BC service tier in your container
Get-NAVServerConfiguration BC

# to set the two nercessary properties for modified Base App development
# DeveloperServicesEnabled should be set to true by default
Set-NAVServerConfiguration -KeyName DeveloperServicesEnabled -KeyValue true -ServerInstance BC
# 'OnPrem' is recommended, although 'Internal' also seems to work
Set-NAVServerConfiguration -KeyName ExtensionAllowedTargetLevel -KeyValue OnPrem -ServerInstance BC

# restarting the service tier is necessary to take effect
Restart-NAVServerInstance -ServerInstance BC


