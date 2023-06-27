function InstallApp {

$url = "https://openapi.com.tw/clientinstall/setup.exe"
$downloadPath = "D:\setup.exe"

# 下載檔案
Invoke-WebRequest -Uri $url -OutFile $downloadPath

# 執行下載的執行檔
Start-Process -FilePath $downloadPath
}

    $keyword = "AppName"  # 輸入你要搜尋的關鍵字

    # 搜尋並移除符合模糊搜尋的 .appref-ms 應用程式
    $softwareList = Get-ChildItem -Path "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" -Filter "*.appref-ms" -Recurse | Where-Object { $_.Name -like "*$keyword*" } 

    if($softwareList) {
        ForEach ($software in $softwareList) {
            $softwareFullName = $software.FullName
            Remove-Item -Path $softwareFullName -Force
            $baseName = $software.BaseName
            Write-Output "已刪除應用程式: $baseName"
        }

        # 從指定路徑刪除目錄
        $userAccount = $env:USERNAME
        $folderPath = "D:\Users\$userAccount\AppData\Local\Apps\2.0"

        if (Test-Path -Path $folderPath) {
            Remove-Item -Path $folderPath -Force -Recurse

            Write-Output "已刪除資料夾: $folderPath"
        }
        InstallApp
    }
    else {
        Write-Output "找不到 $keyword 相關應用程式"
    }



