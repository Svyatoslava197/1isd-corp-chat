@echo off
chcp 65001 > nul
title Messenger Client
echo ===============================
echo   Messenger Client Launcher
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

:: Проверяем наличие client.py
if not exist "client.py" (
    echo ERROR: Файл client.py не найден
    echo Убедитесь, что client.py находится в той же папке
    pause
    exit /b 1
)

echo Запуск клиента мессенджера...
echo Убедитесь, что сервер запущен на localhost:5000
echo.
echo Инструкция:
echo   1. Введите имя пользователя
echo   2. Используйте кнопку '+' для добавления чатов
echo   3. Выберите чат для общения
echo.
echo ===============================

python client.py

if errorlevel 1 (
    echo.
    echo ERROR: Не удалось запустить клиент
    echo Возможные причины:
    echo   - Сервер не запущен
    echo   - Ошибка в коде client.py
    echo   - Отсутствуют необходимые библиотеки
    echo.
    pause
)