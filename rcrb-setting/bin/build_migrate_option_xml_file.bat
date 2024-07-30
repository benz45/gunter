@REM Process update option.xml ganerated to RCEB location.
@ECHO Off
cd %target_location%

if not exist "option.xml" (
	move %path_setting_default_optionxml% %target_location% >nul
	echo - [Success] Put setting to RCRB successfully.
) else (
	@echo off
	del option.xml
	@echo off
	move %path_setting_default_optionxml% %target_location% >nul
	echo - [Success] Patch setting to RCRB successfully.
)

if exist %path_setting_default_optionxml% ( echo - [Warning] Can't update setting to RCRB field. )

@echo off
timeout /t 0.5
taskkill /FI "WINDOWTITLE eq custom" /FI "IMAGENAME eq mycommand" /f | findstr /c:"PID" >nul
