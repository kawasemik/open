@echo off
:windows_bat_hidefileext

:ini
setlocal
set RegKey="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
set RegEntry=HideFileExt
set AddCmd=reg.exe add

:getquery_branch
reg query %RegKey% /v %RegEntry% | find "0x1" >nul
if %ErrorLevel% == 0 goto IfEntHidden
if %ErrorLevel% == 1 goto IfEntShown

:IfEntHidden
%AddCmd% %RegKey% /v %RegEntry% /t REG_DWORD /d 0 /f >nul
goto end

:IfEntShown
%AddCmd% %RegKey% /v %RegEntry% /t REG_DWORD /d 1 /f >nul
goto end

:end
endlocal
exit