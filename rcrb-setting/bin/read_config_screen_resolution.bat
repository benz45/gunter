@echo off
set CONFIG_FILE="%~dp0temp\screen_resolution.conf"

REM Check if the config file exists
@echo off
if not exist "%CONFIG_FILE%" (
    echo Configuration file "%CONFIG_FILE%" not found.
	pause
	exit /b 1
)

REM Read variables from the config file
@echo off
for /f "tokens=1,* delims==" %%A in ('type %CONFIG_FILE%') do (set %%A=%%B)

REM Example usage of variables read from the config file
echo width: %WIDTH%
echo height: %HEIGHT%

pause
exit