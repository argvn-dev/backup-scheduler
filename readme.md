# Backup Scheduler

Backup Scheduler adalah sebuah alat yang bisa digunakan untuk melakukan backup file secara otomatis ke repo GitHub.  
File yang dibackup akan dikompres menjadi file berekstensi .tar.gz.  
  
### Panduan

Untuk menggunakan alat ini, ikuti langkah-langkah berikut:  
  
1. Silakan download [Backup Scheduler](https://github.com/accessmedia-dev/backup-scheduler/archive/refs/heads/master.zip "Download Backup Scheduler")  
2. Ekstrak file hasil download, boleh di folder mana saja
3. Ubah file:  
    - [src/username.txt](https://github.com/accessmedia-dev/backup-scheduler/blob/master/src/username.txt) diisi oleh username GitHub
    - [src/email.txt](https://github.com/accessmedia-dev/backup-scheduler/blob/master/src/email.txt) diisi oleh email GitHub
    - [src/token.txt](https://github.com/accessmedia-dev/backup-scheduler/blob/master/src/token.txt) diisi oleh access_token GitHub
    - [src/source.txt](https://github.com/accessmedia-dev/backup-scheduler/blob/master/src/source.txt) diisi oleh path folder yang akan dibackup
4. Jalankan file [setup.bat](https://github.com/accessmedia-dev/backup-scheduler/blob/master/setup.bat) (double-click).  
  
5. Setelah menjalankan setup di atas, alat ini secara otomatis akan membuat jadwal backup pada pukul 02:00 dengan alur sebagai berikut:  
    - Menjalankan file [src/backup.bat](https://github.com/accessmedia-dev/backup-scheduler/blob/master/src/backup.txt)
    - Semua file dalam folder target ([src/source.txt](https://github.com/accessmedia-dev/backup-scheduler/blob/master/src/source.txt)) akan dikompres menjadi .tar.gz
    - Hasil file yang dikompres akan disimpan di folder data
    - Folder data akan dikirimkan ke repositori GitHub