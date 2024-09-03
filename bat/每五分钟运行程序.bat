@echo off  
set INTERVAL = 300
timeout %INTERVAL%
:Again  
echo Called000000000000000
python C:/test.py 
timeout %INTERVAL%
goto Again  