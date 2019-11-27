# this is the latest OnPrem version of Business Central for North America
$imageName = 'mcr.microsoft.com/businesscentral/onprem:na-ltsc2019'

$licenseFile = '<path to your developer license>.flf'
$ContainerName = '<your container name>'
$UserName = '<your user name>'
$Password = ConvertTo-SecureString '<your password>' -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($UserName, $Password)
$BaseAppPath = '<path to your AL Base App workspace folder>'

