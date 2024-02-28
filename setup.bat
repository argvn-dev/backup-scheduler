@echo off

set /p user_git=<src\username.txt
set /p email_git=<src\email.txt

:: Membaca token dari file token.txt
set /p github_token=<src\token.txt

:: Mendapatkan nama folder saat ini
for %%i in (.) do set "folder_name=%%~nxi"

echo Membuat repositori baru di GitHub dengan nama %folder_name%...
curl -H "Authorization: token %github_token%" https://api.github.com/user/repos -d "{\"name\":\"%folder_name%\", \"private\": true}\" > nul

echo Set up remote...
git init > nul
git remote add origin https://username:%github_token%@github.com/%user_git%/%folder_name%.git > nul

git config user.name "%user_git%"
git config user.email "%email_git%"

git add .
git commit -m "Initial commit"

echo Push ke repositori GitHub...
git push -u origin master

echo Selesai. Repositori %folder_name% telah dibuat di GitHub sebagai repositori pribadi milik %user_git%.

:: Buat env variable
setx BACKUP_BASE_PATH %cd%

:: Tambahkan tugas terjadwal untuk menjalankan skrip batch setiap hari pukul 02:00
schtasks /create /tn "%folder_name%" /tr "%cd%\src\backup.bat" /sc daily /st 02:00 /ru "%USERNAME%" /f

pause
