@echo off
setlocal enabledelayedexpansion

set "counter=1"

for /f "tokens=1* delims=:" %%a in ('dir /b /on *.mp4 ^| findstr /n "^"') do (
    set "newname=!counter!.mp4"
    ren "%%b" "!newname!"
    set /a "counter+=1"
)

echo 重命名完成。
pause
