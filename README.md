# Jarkom-Modul-3-2025-K57

### Member
1. Prabaswara Febrian 5027241069
2. Erlinda Annisa Zahra 5027241108

### Laporan Resmi 

1. Dalam soal ini meminta untuk membangun kembali jaringan komunikasi antar kerajaan di awal Zaman Kedua setelah kehancuran Beleriand, di mana setiap node (kecuali Durin) harus dapat terhubung sementara ke Valinor/Internet melalui nameserver 192.168.122.1 untuk menerima instruksi awal.

![soal_1](images/1a.png)

![soal_1](images/1b.png)

2. Soal ini meminta untuk mengatur pembagian alamat IP secara dinamis bagi client, di mana keluarga Manusia dan Peri mendapatkan rentang IP tertentu, sementara Khamul mendapat IP tetap di 10.92-.3.95, serta memastikan Durin dapat menyebarkan konfigurasi tersebut ke semua wilayah yang terhubung dengannya.

![soal_2](images/2.png)

3. Soal ini meminta untuk mengatur agar seluruh node (kecuali Durin) hanya dapat mengakses atau mengirim data ke dunia luar (Valinor/Internet) melalui menara pengawas Minastir sebagai pengontrol dan pemeriksa arus informasi keluar.

![soal_3](images/3.png)

4. Soal ini meminta untuk membuat sistem penamaan domain (k57.com) dengan Erendis (ns1) sebagai master nameserver dan Amdir (ns2) sebagai slave yang menyalin datanya. Setiap lokasi penting diberi domain unik yang mengarah ke alamat fisik wilayah masing-masing.

![soal_4](images/4a.png)

![soal_4](images/4a.png)

5. Soal ini meminta untuk menambahkan alias www k57.com untuk domain utama, membuat reverse PTR record agar lokasi Erendis dan Amdir dapat dilacak dari alamat IP-nya, serta menambahkan TXT record berisi pesan rahasia “Cincin Sauron” (mengarah ke Elros) dan “Aliansi Terakhir” (mengarah ke Pharazon), yang juga harus disalin oleh Amdir.

![soal_5](images/5a.png)

![soal_5](images/5b.png)

![soal_5](images/5c.png)

![soal_5](images/5d.png)

6. Soal ini meminta untuk mengatur lama waktu peminjaman IP dinamis, di mana keluarga Manusia mendapatkan lease time 30 menit, keluarga Peri 10 menit, dan batas maksimal peminjaman untuk semua client adalah 1 jam.

![soal_6](images/6.png)

![soal_6](images/6b.png)

7. Soal ini meminta untuk menyiapkan lingkungan Laravel pada node para Ksatria Númenor (Elendil, Isildur, Anarion) dengan menginstal PHP 8.4, Composer, dan Nginx, kemudian mengambil resource Laravel di setiap node worker, serta melakukan pengecekan hasil instalasi menggunakan lynx dari sisi client.

![soal_7](images/7.png)

8. Soal ini meminta untuk mengatur koneksi database Palantir pada file .env di setiap worker Laravel, mengonfigurasi Nginx agar masing-masing benteng (Elendil, Isildur, Anarion) berjalan di port 8001, 8002, dan 8003, menjalankan migrasi serta seeding awal dari Elendil, serta membatasi akses web agar hanya dapat dilakukan melalui domain nama, bukan alamat IP.
