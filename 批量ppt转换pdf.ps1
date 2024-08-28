$presentationsPath = "E:\Code\Bat"

$pptApp = New-Object -ComObject PowerPoint.Application
$pptFiles1 = Get-ChildItem -Path $presentationsPath -Filter *.ppt
$pptFiles2 = Get-ChildItem -Path $presentationsPath -Filter *.pptx

$pptFiles = @()
$pptFiles += $pptFiles1
$pptFiles += $pptFiles2

foreach ($file in $pptFiles) {
    try {
        $presentation = $pptApp.Presentations.Open($file.FullName)
        $pdfFile = [System.IO.Path]::ChangeExtension($file.FullName, ".pdf")
        $presentation.SaveAs($pdfFile, 32)
        $presentation.Close()
        Write-Output "转换成功: $($file.FullName) -> $pdfFile"
    } catch {
        Write-Output "转换失败: $($file.FullName) - 错误: $_"
    }
}

$pptApp.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($pptApp)
