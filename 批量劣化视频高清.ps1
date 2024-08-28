function mp4ConvertLow {
    param (
        [string]$Path = "."
    )

    $videoFiles = Get-ChildItem -Path $Path -File -Recurse -Force -ErrorAction SilentlyContinue | Where-Object {
        $_.Extension -in @('.mp4', '.mkv', '.avi', '.mov', '.wmv')
    }
    
    foreach ($file in $videoFiles) {
        try {
            $outputFile = [System.IO.Path]::Combine($file.DirectoryName, "$($file.BaseName)_converted.mp4")
            ffmpeg -i $file.FullName -vf scale=1280:-2 -c:v libx264 -profile:v high -level 3.1 -pix_fmt yuv420p -b:v 1233k -r 25 -c:a aac -b:a 128k -ar 44100 -ac 2 -movflags +faststart $outputFile
            Write-Output "运行成功: $($outputFile)"
        } catch {
            Write-Output "无法运行: $($file.FullName)"
        }
    }
}

mp4ConvertLow
Pause
