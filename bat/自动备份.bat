@echo on
set "src1=C:\Personal storage\Back_up"
set "src2=C:\Personal storage\Storage"
set "dest1=E:\Back_up"
set "dest2=E:\Storage"
xcopy "%src1%" "%dest1%" /D /Y /e /i
xcopy "%src2%" "%dest2%" /D /Y /e /i
pause
