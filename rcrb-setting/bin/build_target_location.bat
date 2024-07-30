@echo off
set target_location=""

@REM Validates a temp directory path for Rebirth RC, and prompts for a new location if invalid.
@echo off
if not exist %path_temp_rebirth_rc_location% (
	echo - [Loading] Cache Rebirth RC location path.
    @echo off
	for /d /r "C:\" %%a in (*) do (
		if /i "%%~nxa"=="RebirthRC-Team" (
			set target_location="%%a\RebirthRC"
			goto :break
		)
	)
	:break
	@echo off
	echo RCRB_LOCATION=%target_location% > %path_temp_rebirth_rc_location%
	echo - [Success] Caching Rebirth RC location path. 
) else (
	@echo off
	for /f "tokens=1,* delims==" %%A in ('type %path_temp_rebirth_rc_location%') do (set target_location=%%B)
	echo - [Success] Used cache Rebirth RC location path. 
)


@REM Check target RCEB folder location path.
@echo off
if %target_location% == "" (
	echo Rebirth RC location path is not available.
	pause
)

@REM Validates a directory path for Rebirth RC, and prompts for a new location if invalid.
@echo off
if not exist %target_location% (
	echo - [Loading] Cache Rebirth RC location path.
    @echo off
	for /d /r "C:\" %%a in (*) do (
		if /i "%%~nxa"=="RebirthRC-Team" (
			set target_location="%%a\RebirthRC"
			goto :break
		)
	)
	:break
	@echo off
	echo RCRB_LOCATION=%target_location% > %path_temp_rebirth_rc_location%
	echo - [Success] Caching Rebirth RC location path. 
)
