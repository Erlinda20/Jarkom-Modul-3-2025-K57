# in Erendis (ns1 master)

# install bind9
apt update && apt install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

# buat folder
mkdir -p /etc/bind/k57
# tambah file zona
zone "k57.com" {
    type master;
    file "/etc/bind/k57/k57.com";
    allow-transfer { 10.92.3.3; };   # IP Amdir
};

# buat file zona 
nano /etc/bind/k57/k57.com
# isinya
$TTL    604800
@       IN      SOA     ns1.k57.com. root.k57.com. (
                        2025103101  ; Serial (YYYYMMDDNN)
                        604800      ; Refresh
                        86400       ; Retry
                        2419200     ; Expire
                        604800 )    ; Negative Cache TTL

; NS records
@       IN      NS      ns1.k57.com.
@       IN      NS      ns2.k57.com.

; A record for domain
@       IN      A       10.92.3.2

; Nameservers
ns1     IN      A       10.92.3.2
ns2     IN      A       10.92.3.3

; Host records
palantir    IN  A       10.92.4.3
elros       IN  A       10.92.1.6
pharazon    IN  A       10.92.2.3
elendil     IN  A       10.92.1.4
isildur     IN  A       10.92.1.3
anarion     IN  A       10.92.1.5
galadriel   IN  A       10.92.2.4
celeborn    IN  A       10.92.2.5
oropher     IN  A       10.92.2.6

# ubah permission folder
chmod 644 /etc/bind/k57/k57.com
chown bind:bind /etc/bind/k57/k57.com

# restart bind9
service bind9 restart

# In Amdir (ns2 slave)
# install bind9
apt update && apt install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

# tambahkan file zona
nano /etc/bind/named.conf.local
# isinya
zone "k57.com" {
    type slave;
    masters { 10.92.3.2; };    # IP Erendis
    file "/var/lib/bind/k57.com";
};

# restart bind9
service bind9 restart

# dijalankan 
# Erendis (ns1 master)
dig @10.92.3.2 k57.com

# Amdir (ns2 slave)
dig @10.92.3.3 k57.com