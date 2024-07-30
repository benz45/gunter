@echo off
for /f "delims=" %%# in  ('"wmic path Win32_VideoController  get CurrentHorizontalResolution,CurrentVerticalResolution /format:value"') do (
  set "%%#">nul
)
set width= %CurrentHorizontalResolution%
set height=%CurrentVerticalResolution%

@echo off
echo WIDTH=%width% > "%root%temp\screen_resolution.conf"
@echo off
echo HEIGHT=%height% >> "%root%temp\screen_resolution.conf"
@echo off
echo WIDTH=%width% > "%root%temp\screen_resolution.txt"
@echo off
echo HEIGHT=%height% >> "%root%temp\screen_resolution.txt"

echo - [Success] Current windows size "%width%"x"%height%"

