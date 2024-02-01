@echo off

echo Iniciando el proceso de compilación y empaquetamiento...

REM Crear directorio para archivos binarios si no existe
if not exist bin mkdir bin

echo Compilando archivos Java...
javac -d bin src\controller\*.java src\model\*.java src\view\*.java
if %errorlevel% neq 0 (
    echo Error en la compilación de archivos Java.
    pause
    exit /b %errorlevel%
)

echo Creando archivo MANIFEST.MF...
(echo Main-Class: controller.LaunchController && echo.) > MANIFEST.MF
if %errorlevel% neq 0 (
    echo Error al crear MANIFEST.MF.
    pause
    exit /b %errorlevel%
)

echo Empaquetando en un archivo JAR...
jar cfm MyApplication.jar MANIFEST.MF -C bin .
if %errorlevel% neq 0 (
    echo Error al empaquetar en un archivo JAR.
    pause
    exit /b %errorlevel%
)

echo Limpieza...
del MANIFEST.MF
rmdir /s /q bin

echo Proceso completado exitosamente.
pause
