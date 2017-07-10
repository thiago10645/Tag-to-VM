######################################################################
# Created By @RicardoConzatti | October 2016
# www.Solutions4Crowds.com.br
######################################################################
# Add snapin on PowerShell
Add-PSSnapin VMware.VimAutomation.Core

# Config vCenter Server
$vCenter="IP or FQDN"
$vCadmin="administrator@vsphere.local"
$vCpass="Your$4cureP@ss"

# Config Path VMs
$txtpath="C:\temp\VMs.txt"

# Connect vCenter Server
Connect-VIServer $vCenter -u $vCadmin -password $vCpass

cls
write-host "##### ASSOCIA TAG EM MÁQUINAS VIRTUAIS #####" -foregroundcolor "green"
write-host ""
write-host "##### BY SOLUTIONS4CROWDS.COM.BR #####" -foregroundcolor "green"
write-host "Tags existentes no ambiente (aguarde...)" -foregroundcolor "green"
# List tags
Get-Tag | Select-Object -Property Name | FT -AutoSize
write-host "As máquinas virtuais abaixo receberão a tag que você digitar" -foregroundcolor "green"
write-host ""

$vmList = Get-Content $txtpath
$vmList

write-host ""
$tag = Read-Host "Digite o nome da Tag"
# Associate tag to VMs
foreach ($vmName in $vmList) {Get-VM $vmName | New-TagAssignment –Tag $tag}

cls

write-host "As máquinas virtuais abaixo foram associadas com a tag" $tag -foregroundcolor "green"
write-host ""
$vmList
write-host ""
pause