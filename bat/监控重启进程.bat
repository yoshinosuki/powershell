:RESTART
 
tasklist /FI "username eq Administrator" | find /C "chrome.exe" > temp.txt
set /p num= < temp.txt
del /F temp.txt
echo %num%
if "%num%" == "0"        start /D "D:\Chrome\Bin\" chrome.exe
ping -n 10 -w 2000 0.0.0.1 > temp.txt
del /F temp.txt
goto RESTART