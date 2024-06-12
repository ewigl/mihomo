@echo off

@REM ################################ Base Variables ################################
SET CLASH_DIR=%~dp0
SET TMP_DIR=%~dp0\tmp

@REM ################################ Create Temp Folder ################################
call :checkTempFolderExists

@REM ################################ Start of File ################################
:sof
echo.
echo Update: 
echo 1. Geo Files
echo 2. Metacubexd
@REM echo 3. Mihomo Core
echo 4. Exit

set /p choice=Number of Choice:

@REM ################################ Choices ################################
if "%choice%" == "1" (
    goto update-geo-files
) else if "%choice%" == "2" (
    goto update-metacubexd
) else if "%choice%" == "3" (
    @REM goto update-mihomo-core
    echo "Invalid choice."
    goto sof
) else if "%choice%" == "4" (
    exit
) else (
    echo "Invalid choice."
    goto sof
)

@REM ################################ Functions ################################
:checkTempFolderExists
if not exist %TMP_DIR% (
  mkdir %TMP_DIR%
)

goto :eof

:getLatestTagFunc
@REM RELEASE API
SET GEO_RELEASES_API="https://api.github.com/repos/Loyalsoldier/v2ray-rules-dat/releases/latest"
SET METACUBEXD_RELEASES_API="https://api.github.com/repos/MetaCubeX/metacubexd/releases/latest"
SET MIHOMO_RELEASES_API="https://api.github.com/repos/MetaCubeX/mihomo/releases/latest"

@REM TAG FILE
SET GEO_TAG_FILE="geo_tag.txt"
SET METACUBEXD_TAG_FILE="metacubexd_tag.txt"
SET MIHOMO_TAG_FILE="mihomo_tag.txt"

@REM type: geo, metacubexd, mihomo
echo param 1, type: %~1

if "%~1" == "geo" (
    SET RELEASE_API=%GEO_RELEASES_API%
    SET TAG_FILE=%GEO_TAG_FILE%
) else if "%~1" == "metacubexd" (
    SET RELEASE_API=%METACUBEXD_RELEASES_API%
    SET TAG_FILE=%METACUBEXD_TAG_FILE%
) else if "%~1" == "mihomo" (
    SET RELEASE_API=%MIHOMO_RELEASES_API%
    SET TAG_FILE=%MIHOMO_TAG_FILE%
) else (
    echo "Invalid type."
    goto sof
)

curl -s %RELEASE_API% | findstr "tag_name" > %TMP_DIR%\%TAG_FILE%
set /p LATEST_TAG_LINE=<%TMP_DIR%\%TAG_FILE%

if "%LATEST_TAG_LINE%" == "" (
    echo Failed to get latest tag, for more details, see %RELEASE_API%
    goto sof
)

if "%~1" == "geo" (
    SET GEO_LATEST_TAG=%LATEST_TAG_LINE:~15,-2%
) else if "%~1" == "metacubexd" (
    SET METACUBEXD_LATEST_TAG=%LATEST_TAG_LINE:~15,-2%
) else if "%~1" == "mihomo" (
    SET MIHOMO_LATEST_TAG=%LATEST_TAG_LINE:~15,-2%
) else (
    echo "Invalid type."
    goto sof
)

goto :eof

@REM ################################ Update Geo Files ################################
:update-geo-files
call :checkTempFolderExists
@REM SET GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat"
@REM SET GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat"
SET GEOIP_URL="https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat"
SET GEOSITE_URL="https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat"

echo #### Backup old dat files...

if not exist .\GeoIP.dat (
  echo #### Old GeoIP.dat does not exist.
) else (
  mv %CLASH_DIR%\GeoIP.dat %TMP_DIR%\GeoIP.dat.bak
)

if not exist .\GeoSite.dat (
  echo #### Old GeoSite.dat does not exist.
) else (
  mv %CLASH_DIR%\GeoSite.dat %TMP_DIR%\GeoSite.dat.bak
)

echo #### Downloading GeoIP.dat files...
curl -s -L --output-dir %CLASH_DIR% -o GeoIP.dat %GEOIP_URL%

echo #### Downloading GeoSite.dat...
curl -s -L --output-dir %CLASH_DIR% -o GeoSite.dat %GEOSITE_URL%

echo #### Geo files updated.

goto sof

@REM ################################ Update Metacubexd ################################
:update-metacubexd
call :checkTempFolderExists
SET METACUBEXD_DIR=%~dp0\metacubexd
SET COMPRESSED_DIST=compressed-dist.tgz
SET METACUBEXD_URL="https://github.com/MetaCubeX/metacubexd/releases/latest/download/%COMPRESSED_DIST%"

echo #### Downloading latest metacubexd zip file to temp folder...
curl -s -L --output-dir %TMP_DIR% -o %COMPRESSED_DIST% %METACUBEXD_URL%

echo #### Deleting old metacubexd files...
if not exist %METACUBEXD_DIR% (
    echo #### Metacubexd dir does not exist, creating...
    mkdir %METACUBEXD_DIR%
    echo #### Metacubexd dir created.
) else (
    rmdir /S /Q %METACUBEXD_DIR%
    mkdir %METACUBEXD_DIR%
)

echo #### Extract zip file to metacubexd dir...
tar -xf %TMP_DIR%\%COMPRESSED_DIST% -C %METACUBEXD_DIR%

echo #### Metacubexd updated.
goto sof

@REM ################################ Update Mihomo Core ################################
:update-mihomo-core
call :checkTempFolderExists
SET MIHOMO_CORE_PREFIX=mihomo-windows-amd64

echo Get latest core version...
call :getLatestTagFunc mihomo
echo Latest mihomo core version: %MIHOMO_LATEST_TAG%
SET MIHOMO_FILE_NAME=%MIHOMO_CORE_PREFIX%-%MIHOMO_LATEST_TAG%.zip
SET MIHOMO_LATEST_URL="https://github.com/MetaCubeX/mihomo/releases//latest/download/%MIHOMO_FILE_NAME%"

echo Downloading latest core...
curl -L --output-dir %TMP_DIR% -o %MIHOMO_FILE_NAME% %MIHOMO_LATEST_URL%

echo Extracting latest core...
tar -xf %TMP_DIR%\%MIHOMO_FILE_NAME% -C %TMP_DIR%\%METACUBEXD_DIR%
@REM echo Mihomo core sucessfully downloaded to tmp folder. Please stop Mihomo then @#%$#@&^($@^()...

@REM TODO
echo Latest core downloaded, stop mihomo and start update process?
set /p YesOrNo=y / n: 

if /i "%YesOrNo%" == "y"  (
  @REM Do Update
) else if /i "%YesOrNo%" == "n"  (
    goto sof
) else (
    echo "Invalid input, update cancelled."
    goto sof
)

goto sof

@REM ################################ End of File ################################
pause
