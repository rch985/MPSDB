@echo off

:: #### B.01 database create ####


set LOGFILE="D:\WorkFile\03WorkProject\MPS\DB\DBScript\DbLog.log"


:: Tell user that the installation process is starting.
echo This script will create the database MPS. Would you like to proceed with this create?

CHOICE /C YN

IF ERRORLEVEL 2 GOTO EOF

echo Installing the database ...

sqlcmd /S . /U sa /P United-Imaging /d master -i "01CreateDb.sql"  >> %LOGFILE% 2>&1
if /I %ERRORLEVEL% EQU 1 (
   echo [%DATE% %TIME%] Error running "01CreateDb.sql" >> %LOGFILE% 2>&1
   goto :FAILURE 
)
echo [%TIME%] "01CreateDb.sql" was successfully applied ...

sqlcmd /S . /U sa /P United-Imaging /d master -i "02CreateTable.sql"  >> %LOGFILE% 2>&1
if /I %ERRORLEVEL% EQU 1 (
   echo [%DATE% %TIME%] Error running "02CreateTable.sql" >> %LOGFILE% 2>&1
   goto :FAILURE 
)
echo [%TIME%] "02CreateTable.sql" was successfully applied ...

sqlcmd /S . /U sa /P United-Imaging /d master -i "03CreateInit.sql"  >> %LOGFILE% 2>&1
if /I %ERRORLEVEL% EQU 1 (
   echo [%DATE% %TIME%] Error running "03CreateInit.sql" >> %LOGFILE% 2>&1
   goto :FAILURE 
)
echo [%TIME%] "03CreateInit.sql" was successfully applied ...

goto :DONE

:FAILURE
echo ERROR: Installation failed, see %LOGFILE% for details
echo [%DATE% %TIME%] ERROR: Installation failed >> %LOGFILE%

:DONE
pause

