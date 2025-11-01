# in Minastir
# install bind9
apt update && apt install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

# konfigurasi bind9
nano /etc/bind/named.conf.options
# isinya
options {
    directory "/var/cache/bind";

    forwarders {
        192.168.122.1;    
    };

    allow-query { any; };
    recursion yes;
    dnssec-validation no;

    listen-on-v6 { any; };
};

# restart bind9
service bind9 restart
# cek status
service bind9 status

# In Aldarion
# bagian /etc/dhcp/dhcpd.conf ubah bagian 
option domain-name-servers 192.168.122.1;
# menjadi (karena menunjukkan DNS resolver semua client diarahkan ke Minastir)
option domain-name-servers 10.92.5.2;  

# Testing in elendil  or salah satu node
ping google.com -c 2
