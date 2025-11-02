#ELENDIL

nano /var/www/laravel-app/.env

#Isi dengan:
APP_NAME=elednil
APP_ENV=local
APP_KEY=base64:...
APP_DEBUG=true
APP_URL=http://elendil.numenor:8001

DB_CONNECTION=sqlite
DB_HOST=10.92.4.2
DB_PORT=3306
DB_DATABASE=elendil_db
DB_USERNAME=elendil_user
DB_PASSWORD=elendil_pass

nano /etc/nginx/sites-available/elendil.numenor

#Isi dengan:
server {
    listen 8001;
    listen [::]:8001;
    server_name elendil.numenor;

    root /var/www/laravel-app/public;
    index index.php index.html index.htm;

    if ($host != "elendil.numenor") {
        return 444;
    }

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}

ln -s /etc/nginx/sites-available/elendil.numenor /etc/nginx/sites-enabled/
nginx -t
nginx -s reload

cd /var/www/laravel-app
php artisan migrate --seed

nano /etc/hosts

#Tambahkan:
127.0.0.1    elendil.numenor

#Tes
curl http://elendil.numenor:8001


#ISILDUR 
nano /var/www/laravel-app/.env

#Isi dengan:
APP_NAME=isildur
APP_ENV=local
APP_KEY=base64:...
APP_DEBUG=true
APP_URL=http://isildur.numenor:8002

DB_CONNECTION=sqlite
DB_HOST=10.92.4.2
DB_PORT=3306
DB_DATABASE=isildur_db
DB_USERNAME=isildur_user
DB_PASSWORD=isildur_pass

nano /etc/nginx/sites-available/elendil.numenor

#Isi dengan:
server {
    listen 8002;
    listen [::]:8002;
    server_name isildur.numenor;

    root /var/www/laravel-app/public;
    index index.php index.html index.htm;

    if ($host != "isildur.numenor") {
        return 444;
    }

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}

ln -s /etc/nginx/sites-available/isildur.numenor /etc/nginx/sites-enabled/
nginx -t
nginx -s reload

nano /etc/hosts

#Tambahkan:
127.0.0.1 isildur.numenor

#Tes
curl http://elendil.numenor:8002

#ANARION
nano /var/www/laravel-app/.env

#Isi dengan:
PP_NAME=anarion
APP_ENV=local
APP_KEY=base64:...
APP_DEBUG=true
APP_URL=http://isildur.numenor:8003

DB_CONNECTION=sqlite
DB_HOST=10.92.4.2
DB_PORT=3306
DB_DATABASE=anrion_db
DB_USERNAME=anarion_user
DB_PASSWORD=anarion_pass

nano /etc/nginx/sites-available/anarion.numenor

#Isi dengan:
server {
    listen 8003;
    listen [::]:8003;
    server_name anarion.numenor;

    root /var/www/laravel-app/public;
    index index.php index.html index.htm;

    if ($host != "anarion.numenor") {
        return 444;
    }

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}

ln -s /etc/nginx/sites-available/anarion.numenor /etc/nginx/sites-enabled/
nginx -t
nginx -s reload

nano /etc/hosts

#Tambahkan:
127.0.0.1 anarion.numenor

#Tes:
curl http://anarion.numenor:8003
