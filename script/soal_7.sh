# Install di setiap node Laravel Worker (Elendil, Isildur, Anarion)

# Update dan install dependensi dasar
apt update && apt upgrade -y
apt install -y git unzip curl ca-certificates lsb-release apt-transport-https nginx

# Tambahkan repo PHP modern (Sury)
apt install -y lsb-release ca-certificates apt-transport-https curl gnupg2
curl -sSL https://packages.sury.org/php/README.txt | bash -x

# Install PHP 8.4 dan ekstensi penting
apt install -y php8.4 php8.4-cli php8.4-fpm php8.4-mbstring php8.4-xml php8.4-curl php8.4-zip php8.4-bcmath php8.4-intl php8.4-sqlite3
php -v

# Install Composer
cd /tmp
curl -sS https://getcomposer.org/installer -o composer-setup.php
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer -V

# Install Nginx
apt install -y nginx
systemctl enable nginx
nginx -t
ps aux | grep nginx

# Buat proyek laravel baru
cd /var/www
composer create-project laravel/laravel laravel-app

# Setel izin direktori
chown -R www-data:www-data /var/www/laravel-app
chmod -R 755 /var/www/laravel-app

# Konfigurasi Nginx untuk Laravel
nano /etc/nginx/sites-available/laravel

# Isi dengan konfigurasi berikut:
server {
    listen 80;
    server_name _;

    root /var/www/laravel-app/public;
    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}

# Aktifkan dan restart
ln -s /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/
nginx -t
nginx -s reload

# Install Lynx
apt update
apt install -y lynx

# Di Elros (Load Balancer), tes akses ke Laravel Worker
apt update && apt install -y nginx
service nginx start

# Buat Resource Laravel di Load Balancer (Elros)
cd /var/www/html
echo "Laravel Resource Server - Elros" > index.html

# Tes akses dari Elros ke Laravel di Worker (Elendil, Isildur, Anarion)
lynx http://10.92.1.6




