function Remove-DotDSStoreAndMacOSX {
    param (
        [string]$Path = "."
    )

    # 获取所有的 .DS_Store 文件和 __MACOSX 文件夹
    $dsStoreFiles = Get-ChildItem -Path $Path -Filter .DS_Store -Recurse -Force -ErrorAction SilentlyContinue
    $macOSXFolders = Get-ChildItem -Path $Path -Filter __MACOSX -Recurse -Force -ErrorAction SilentlyContinue
    # 合并两个结果
    $files = $dsStoreFiles + $macOSXFolders
    foreach ($file in $files) {
        try {
            # 尝试删除文件或文件夹
            Remove-Item -Path $file.FullName -Recurse -Force
            Write-Output "已删除: $($file.FullName)"
        } catch {
            # 捕获到权限错误，输出提示
            Write-Output "无法删除: $($file.FullName) - 权限被拒绝"
        }
    }
}

# 调用函数示例
Remove-DotDSStoreAndMacOSX 
Pause