$documentsPath = "E:\Code\Bat"

$wordApp = New-Object -ComObject Word.Application
$wordApp.Visible = $false

$docFiles = Get-ChildItem -Path $documentsPath -Filter *.doc
$docxFiles = Get-ChildItem -Path $documentsPath -Filter *.docx

$wordFiles = @()
$wordFiles += $docFiles
$wordFiles += $docxFiles

foreach ($file in $wordFiles) {
    try {
        $doc = $wordApp.Documents.Open($file.FullName)
        $pdfFile = [System.IO.Path]::ChangeExtension($file.FullName, ".pdf")
        $doc.SaveAs([ref] $pdfFile, [ref] 17)  # 17 表示 PDF 格式
        $doc.Close()
        Write-Output "转换成功: $($file.FullName) -> $pdfFile"
    } catch {
        Write-Output "转换失败: $($file.FullName) - 错误: $_"
    }
}

$wordApp.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($wordApp)

