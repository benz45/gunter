net session >nul 2>&1 || (powershell start -verb runas '"%~0"' &exit /b)
@echo off
color A

@REM Set sys32 folder work directory. C:\..\sys32\
@echo off
set sys=%cd%\

@REM Set root folder work directory. C:\..\rcrb-setting\
@echo off
set root=%~dp0

@REM Set work folder directory script. C:\..\rcrb-setting\bin\
@echo off
set bin=%~dp0bin\

@REM Change directory to work folder directory.
cd %bin%

set path_setting_default_optionxml=%root%setting\default\option.xml

set path_temp_rebirth_rc_location=%root%temp\rebirth_rc_location.conf

@REM Version numbers help users and developers understand the evolution of software, manage updates.
set version=1.0

@REM Execute the file build_header_title.bat and pass a version number.
call build_header_title.bat %version%

@REM Execute the build_screen_resolution.bat file to obtain the screen resolution size (variable "width" and "height").
call build_screen_resolution.bat

@REM Execute the build_default_option_xml_file.bat file for build new option file.
cd %bin%
call build_default_option_xml_file.bat "%width%" "%height%"

@REM Validates a directory path for Rebirth RC, and prompts for a new location if invalid.
cd %bin%
call build_target_location.bat

@REM Execute the build_migrate_option_xml_file.bat file for move option.xml file to rcrb folder.
cd %bin%
call build_migrate_option_xml_file.bat

