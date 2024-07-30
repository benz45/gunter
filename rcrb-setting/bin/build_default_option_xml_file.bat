@echo off

if not "%~1" == "" goto :found
if not "%~2" == "" goto :found

echo Generate setting not found argument width size and height size.
pause
goto :eof

:found

@echo off
set WIDTH=%~1
@echo off
set diminish=80
@echo off
set /a "HEIGHT=%~2-%diminish%"

@REM @echo off
@REM (
@REM echo ^<options^>
@REM echo     ^<graphic
@REM echo         fullscreen="true"
@REM echo         fullScreenWidth="%WIDTH%"
@REM echo         fullScreenHeight="%HEIGHT%"
@REM echo         fullScreenDepth="75"
@REM echo         windowScreenWidth="%WIDTH%"
@REM echo         windowScreenHeight="%HEIGHT%"
@REM echo         windowScreenDepth="75" 
@REM echo         screenHz="75" 
@REM echo         screenAdapter="0" 
@REM echo         multiSampleType="4" 
@REM echo         sightDistance="0" 
@REM echo         dwsOn="false" 
@REM echo         carCountLevel="0" 
@REM echo         carTexLevel="0" 
@REM echo         envmapLevel="1" 
@REM echo         carEffectLevel="1" 
@REM echo         carLodLevel="1" 
@REM echo         fieldLevel="1" 
@REM echo         texDetailLevel="0" 
@REM echo         lightTexDetailLevel="2" 
@REM echo         renderSignboard="true" 
@REM echo         waterReflection="false" 
@REM echo         sceneGlowOn="false" 
@REM echo         motionBlurOn="false" 
@REM echo         reflection="false" 
@REM echo         bloomLevel="0" 
@REM echo         dynLight2="0" 
@REM echo     ^/^>
@REM echo     ^<sound
@REM echo         bgmOn="false"
@REM echo         bgmVolume="0.30"
@REM echo         effectOn="true"
@REM echo         effectVolume="0.30"
@REM echo         engineOn="false"
@REM echo         engineVolume="0.20"
@REM echo     ^/^>
@REM echo     ^<etc
@REM echo         chatBalloon="true"
@REM echo         fixedResOn="false"
@REM echo         interfaceTooltipOn="true"
@REM echo         questFavoriteOn="true"
@REM echo         quickOptionStatus="4"
@REM echo         useSingleCore="false"
@REM echo         facebookOn="true"
@REM echo         guildLogoOn="true"
@REM echo     ^/^>
@REM echo     ^<request
@REM echo         partyInvOn="true"
@REM echo         friendAddOn="true"
@REM echo         guildInvOn="true"
@REM echo         tradeAskOn="true"
@REM echo         personalChatOn="2"
@REM echo     ^/^>
@REM echo ^<^/options^>
@REM ) > "%root%setting\default\option.xml"

@echo off
(
echo ^<options^>
echo     ^<graphic
echo         fullscreen="false"
echo         fullScreenWidth="%WIDTH%"
echo         fullScreenHeight="%HEIGHT%"
echo         fullScreenDepth="75"
echo         windowScreenWidth="%WIDTH%"
echo         windowScreenHeight="%HEIGHT%"
echo         windowScreenDepth="75"
echo         screenHz="180"
echo         screenAdapter="0"
echo         multiSampleType="4"
echo         sightDistance="0"
echo         dwsOn="false"
echo         carCountLevel="0"
echo         carTexLevel="0"
echo         envmapLevel="0"
echo         carEffectLevel="0"
echo         carLodLevel="1"
echo         fieldLevel="0"
echo         texDetailLevel="0"
echo         lightTexDetailLevel="0"
echo         renderSignboard="true"
echo         waterReflection="true"
echo         sceneGlowOn="false"
echo         motionBlurOn="false"
echo         reflection="true"
echo         bloomLevel="0"
echo         dynLight2="0"
echo     ^/^>
echo     ^<sound
echo         bgmOn="false"
echo         bgmVolume="0.30"
echo         effectOn="true"
echo         effectVolume="0.30"
echo         engineOn="true"
echo         engineVolume="0.20"
echo     ^/^>
echo     ^<etc
echo         chatBalloon="true"
echo         fixedResOn="false"
echo         interfaceTooltipOn="true"
echo         questFavoriteOn="true"
echo         quickOptionStatus="4"
echo         useSingleCore="false"
echo         facebookOn="true"
echo         guildLogoOn="true"
echo     ^/^>
echo     ^<request
echo         partyInvOn="true"
echo         friendAddOn="true"
echo         guildInvOn="true"
echo         tradeAskOn="true"
echo         personalChatOn="2"
echo     ^/^>
echo ^<^/options^>
) > %path_setting_default_optionxml%

REM Check if the config file exists
@echo off
if exist %path_setting_default_optionxml% ( echo - [Success] Create setting file. ) else ( echo - [Warning] Create setting file.)