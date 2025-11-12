@echo off
chcp 65001 > nul
title Messenger Server
echo ===============================
echo    Messenger Server Launcher
echo ===============================
echo.

:: Проверяем, установлен ли Python
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python не установлен или не добавлен в PATH
    echo Установите Python с официального сайта: https://python.org
    pause
    exit /b 1
)

:: Проверяем наличие server.py
if not exist "server.py" (
    echo ERROR: Файл server.py не найден
    echo Убедитесь, что server.py находится в той же папке
    pause
    exit /b 1
)

echo Запуск сервера мессенджера...
echo Сервер будет запущен на localhost:5000
echo.
echo Доступные команды в консоли сервера:
echo   - stop     : Остановить сервер
echo   - status   : Показать статус
echo   - save     : Сохранить данные вручную
echo   - repair_data : Восстановить данные
echo.
echo Для остановки сервера используйте команду 'stop' в консоли
echo или закройте это окно.
echo.
echo ===============================

python server.py

if errorlevel 1 (
    echo.
    echo ERROR: Не удалось запустить сервер
    echo Возможные причины:
    echo   - Порт 5000 уже занят
    echo   - Ошибка в коде server.py
    echo   - Отсутствуют необходимые библиотеки
    echo.
    pause
)