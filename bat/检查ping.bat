@echo off
set filePath=C:/personal_storage/new/pingRecord.csv
set ping_url=www.baidu.com
set sleep_times=1

:: 获取脚本开始时间
set start=%time%

:top
:: 检查是否已经运行了10分钟
call :CheckTime
if %minutes% geq 10 goto :eof

echo starting test network...
set "result="
for /f "tokens=9" %%i in ('ping %ping_url% -n 1') do (
	set "result=%%i"
	goto next
)
:next
echo %date% %time% , %result%>>%filePath%
ping -n %sleep_times% 127.1 >nul
goto top

:CheckTime
:: 计算已经过去的时间
set /a "hours=%time:~0,2%*60 + %time:~3,2% - %start:~0,2%*60 - %start:~3,2%"
set /a "minutes=hours%%60"
exit /b
