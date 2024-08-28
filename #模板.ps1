# 常用
$outputFile = [System.IO.Path]::Combine($file.DirectoryName, "$($file.BaseName)_converted.mp4")
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Where-Object {$_.Extension -in @('.mp4', '.mkv', '.avi', '.mov', '.wmv')}
# 定时
while ($true) {
    $currentTime = Get-Date
    $targetTime = [datetime]::Today.AddHours(12) # 设置目标时间为12点

    if ($currentTime -ge $targetTime) {
        $targetTime = $targetTime.AddDays(1)
    }

    $timeToWait = $targetTime - $currentTime
    Write-Output "等待时间: $($timeToWait.TotalSeconds) 秒"

    Start-Sleep -Seconds $timeToWait.TotalSeconds

    try {
        # 在这里放置你想要执行的任务
        Write-Output "执行任务: $(Get-Date)"
         
    } catch {
        Write-Output "任务执行失败: $_"
    }
}

# 常用函数
while ($true) {
    try {
        # 任务
        Write-Output "执行任务: $(Get-Date)"    
    } catch {
        Write-Output "任务执行失败: $_"
    }
    Start-Sleep -Seconds 300
}

# 1. for 循环
# for 循环用于在指定条件为 true 时重复执行代码块。以下示例将数字从 1 打印到 10：

for ($i = 1; $i -le 10; $i++) {
    Write-Output "数字: $i"
}

# 2. foreach 循环
# foreach 循环用于遍历集合中的每个元素。以下示例遍历一个数组并打印每个元素：

$array = 1..5
foreach ($item in $array) {
    Write-Output "数组元素: $item"
}

# 3. while 循环
# while 循环在指定条件为 true 时重复执行代码块。以下示例将数字从 1 打印到 5：

$i = 1
while ($i -le 5) {
    Write-Output "数字: $i"
    $i++
}

# 4. do-while 循环
# do-while 循环至少执行一次代码块，然后在指定条件为 true 时继续执行。以下示例将数字从 1 打印到 5：

$i = 1
do {
    Write-Output "数字: $i"
    $i++
} while ($i -le 5)
