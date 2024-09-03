rem *******************************Code Start*****************************
 
@echo off
 
start /d "E:\rongpingtai\apache-activemq-5.14.1-bin\apache-activemq-5.14.1\bin\win64\"  activemq.bat
 
start /d  "E:\rongpingtai\reids\"  redisServer.bat  rem : “/d” 指定启动目录
 
start /d "E:\rongpingtai\apache-tomcat-7.0.81\bin\"  startup.bat
 
@echo on
 
rem ***************************Code End*****************************