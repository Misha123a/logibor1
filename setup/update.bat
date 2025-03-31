@echo off
setlocal EnableDelayedExpansion

:: Получаем текущую папку, где лежит .bat
set "CURRENT_DIR=%~dp0"
cd /d "%CURRENT_DIR%"

echo [*] Обновление FrishkaBot...

:: Удаляем старый bot.exe
echo [*] Удаление старого bot.exe...
del /f /q "bot.exe"

:: Скачивание нового bot.exe
echo [*] Скачивание нового bot.exe...
powershell -Command "Invoke-WebRequest 'https://raw.githubusercontent.com/Misha123a/logibor1/main/update/bot.exe' -OutFile 'bot.exe'"

:: Проверка, скачался ли файл
if exist "bot.exe" (
    echo [✔] Обновление завершено успешно!
) else (
    echo [✘] Ошибка: bot.exe не был загружен!
)

timeout /t 2 >nul
exit
