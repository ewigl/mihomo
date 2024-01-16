@echo off

SET CLASH_DIR=%~dp0
SET TMP_DIR=%~dp0\tmp
SET METACUBEXD_DIR=%~dp0\metacubexd
SET FILE_NAME=compressed-dist.tgz

SET METACUBEXD_URL="https://github.com/MetaCubeX/metacubexd/releases/latest/download/compressed-dist.tgz"

echo 0. Downloading latest metacubexd zip file...
curl -L --output-dir %TMP_DIR% -o %FILE_NAME% %METACUBEXD_URL%

echo 1. Delete old metacubexd files...
del /s /q %METACUBEXD_DIR%

echo 2. Extract zip file to metacubexd dir...
tar -xf %TMP_DIR%\%FILE_NAME% -C %METACUBEXD_DIR%

echo 3. DONE.
pause
