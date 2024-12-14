# 使用 System.Windows.Forms 命名空间
Add-Type -AssemblyName System.Windows.Forms

# 从剪贴板获取图像
$image = [System.Windows.Forms.Clipboard]::GetImage()

# 检查剪贴板中是否有图像
if ($image -ne $null) {
    $timestamp = (Get-Date).ToString("yyyyMMdd_HHmmss")
    # 定义保存路径和文件名
    $filePath = "C:\Users\surface\Desktop\fsdownload\Clip__$timestamp.png"  # 请修改为你想要保存的路径和文件名

    # 保存图像为文件
    $image.Save($filePath, [System.Drawing.Imaging.ImageFormat]::Png)
    
    Write-Host "图像已保存到 $filePath"
} else {
    Write-Host "剪贴板中没有图像。"
}
