@echo off    
setlocal enabledelayedexpansion    
  
:: 设置起始数字    
set "counter=1"    
  
:: 遍历当前目录下的所有文件    
for %%f in (*) do (    
    :: 检查文件扩展名是否为.jpg或.bat，以避免重复命名    
    if not "%%~xf"==".jpg" if not "%%~xf"==".bat" (    
        :: 构造新的文件名    
        set "newname=!counter!.jpg"    
            
        :: 重命名文件    
        ren "%%f" "!newname!"    
            
        :: 更新计数器    
        set /a "counter+=1"    
    )    
)    
  
echo 重命名完成。    
pause