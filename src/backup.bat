@echo off

set /p SOURCE_FOLDER=<%BACKUP_BASE_PATH%\src\source.txt
set TARGET_FOLDER=%BACKUP_BASE_PATH%

echo %SOURCE_FOLDER%
echo %TARGET_FOLDER%

:: Mendapatkan tanggal dan waktu saat ini
for /f "tokens=1-6 delims=/: " %%a in ("%date% %time%") do (
    set datetime=%%c%%b%%a
)

:: Nama file arsip dengan format YmdHis.gz
set ARCHIVE_NAME=%COMPUTERNAME%_%datetime%.tar.gz

:: Fungsi untuk mengompres semua file menjadi satu file .tar.gz
:COMPRESS_FILES
echo Mengompres file ke .tar.gz...
tar -czvf "%TARGET_FOLDER%\data\%ARCHIVE_NAME%" "%SOURCE_FOLDER%\*"

:: Push ke github
cd /d %BACKUP_BASE_PATH%
git add %BACKUP_BASE_PATH%/data/*
git commit -m "%ARCHIVE_NAME%"
echo Push ke GitHub...
git push origin master
pause