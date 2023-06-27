# Remove-Appreference

## To remove a ClickOnce application using PowerShell, as the .appref-ms application cannot be found through the following method.

```powershell
$installedApps = Get-WmiObject -Class Win32_Product
```
or 
```powershell
$apps = Get-AppxPackage
```

## 移除透過ClickeOnce安裝的應用程式，而無法透過上述的方式找到安裝的 appref-ms應用程式
