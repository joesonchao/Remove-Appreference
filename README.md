# Remove-Appreference

To remove a ClickOnce application using PowerShell, as the .appref-ms application cannot be found through the following method.

```powershell
$installedApps = Get-WmiObject -Class Win32_Product
```
or 
```powershell
$apps = Get-AppxPackage
```
