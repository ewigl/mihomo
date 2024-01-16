@echo off

SET CLASH_DIR=%~dp0
SET TMP_DIR=%~dp0\tmp

@REM SET GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geoip.dat"
@REM SET GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/raw/release/geosite.dat"
SET GEOIP_URL="https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat"
SET GEOSITE_URL="https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat"

echo 0. Start

echo 1. Backup old dat files...
mv %CLASH_DIR%\GeoIP.dat %TMP_DIR%\GeoIP.dat.bak
mv %CLASH_DIR%\GeoSite.dat %TMP_DIR%\GeoSite.dat.bak

echo 2. Downloading geoip.dat files...
curl -L --output-dir %CLASH_DIR% -o GeoIP.dat %GEOIP_URL%

echo 3. Downloading geosite.dat...
curl -L --output-dir %CLASH_DIR% -o GeoSite.dat %GEOSITE_URL%

echo 4. DONE.
pause
