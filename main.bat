@echo off

REM Grupo: 4CV3
REM Equipo: *nullpointer

REM Elaborado por:
REM -Alfaro Campos José Miguel
REM -Corro Mendoza Onasis Alejandro
REM -Luis Luis Angel Alexis
REM -Herrera Mauricio Pedro Alonso

REM Version: 0.1.0 

echo Elaborado por:
type TituloLogoSello.txt
echo .
echo .
echo Hola y bievenido a la herramienta de respaldo
CALL :printLine
echo Mostrando las unidades USB conectadas:
CALL :showUSBS

CALL :printLine
echo Escribe la letra de la unidad USB que deseas copiar
SET /p USB=LETRA USB:
echo Letra usb seleccionada %USB%
SET dirname=backup
SET /p dirname=Nombre de la carpeta de respaldo (presione enter para usar %dirname%): 
SET "backupPATH=%USB%:\%dirname%"
echo carpeta de respaldo %backupPATH%

CALL :printLine
CALL :showDirectoriesToBackup

echo ¿Desea comprimir en zip?
echo 1. Si
echo 2. No
choice /c 12 /n /m "seleccione (1 o 2): "

REM Almacenar el resultado de choice en la variable errorlevel
set opcion=%errorlevel%
echo opcion %opcion%

REM dependiendo si decide usar compresion o no, o solo movemos o solo compremimos

IF %opcion% == 1 (
	REM MUST IMPLEMENT A COMPRESSION LOGIC HERE
	
    
) ELSE ( 
    REM Copia los archivos a la memoria seleccionadoa
    CALL :copyFiles "%userprofile%\Documents" "%backupPATH%\Documentos"
    CALL :copyFiles "%userprofile%\Pictures" "%backupPATH%\Fotos"
    CALL :copyFiles "%userprofile%\Music" "%backupPATH%\Musica"
    CALL :copyFiles "%userprofile%\Videos" "%backupPATH%\Videos"

    ECHO "Archivos copiados"
)

REM Fin del script principal
EXIT /B 0 


REM definicion de funciones

:showUSBS
wmic logicaldisk where "drivetype=2" get deviceid, volumename
EXIT /B 0

:showDirectoriesToBackup
echo == Carpetas a respaldar ==
echo 1. Documentos
echo 2. Videos
echo 3. Fotos
echo 4. Musica


EXIT /B 0

:printLine
echo ==============================================
EXIT /B 0

:copyFiles
SET src=%~1
SET dest=%~2

ECHO copiando de "%src%" a "%dest%"
robocopy "%src%" "%dest%" /E /XJ

EXIT /B 0

cls
