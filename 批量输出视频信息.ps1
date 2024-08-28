function Get-VideoInfo {
    param (
        [string]$FilePath
    )

    try {
        $ffprobePath = "ffprobe.exe"  # 指定 ffprobe 的路径，确保它在环境变量中或者指定完整路径
        $probe = & $ffprobePath -v error -show_entries stream=codec_type,duration,width,height,r_frame_rate -of json $FilePath | ConvertFrom-Json
        $videoInfo = $probe.streams | Where-Object { $_.codec_type -eq 'video' } | Select-Object -First 1
        $size = (Get-Item $FilePath).length
        $duration = [float]$videoInfo.duration
        $width = [int]$videoInfo.width
        $height = [int]$videoInfo.height
        $frameRate = [math]::Round($videoInfo.r_frame_rate -replace '/.*', '')

        return @{
            size = $size
            duration = $duration
            resolution = "$width`x$height"
            frame_rate = $frameRate
        }
    } catch {
        Write-Host "Error getting info "
        return $null
    }
}

function Get-Videos {
    param (
        [string]$Directory
    )

    $videoData = @{}

    Get-ChildItem -Path $Directory -Recurse -File | Where-Object {
        $_.Extension -in @('.mp4', '.mkv', '.avi', '.mov', '.wmv')
    } | ForEach-Object {
        $filePath = $_.FullName
        $info = Get-VideoInfo -FilePath $filePath
        if ($info) {
            $videoData[$filePath] = $info
        }
    }

    return $videoData
}

$directory = Get-Location
$videoData = Get-Videos -Directory $directory
$videoInfoJson = $videoData | ConvertTo-Json -Depth 10
Set-Content -Path 'video_info.json' -Value $videoInfoJson -Encoding utf8
Write-Host "Video information has been saved to video_info.json"
Pause



