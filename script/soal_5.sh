# in erendis 

# buat file konfigurasi zona
nano /etc/bind/k57/k57.com
# isinya
; Alias (CNAME)
www     IN  CNAME   k57.com.

; TXT Records (pesan rahasia)
elros       IN  TXT   "Cincin Sauron"
pharazon    IN  TXT   "Aliansi Terakhir"

# buat reverse zone file
mkdir -p /etc/bind/k57
nano /etc/bind/k57/3.92.10.in-addr.arpa
# isinya
$TTL 604800
@       IN      SOA     ns1.k57.com. root.k57.com. (
                        2025110101  ; Serial
                        604800      ; Refresh
                        86400       ; Retry
                        2419200     ; Expire
                        604800 )    ; Negative Cache TTL

        IN      NS      ns1.k57.com.
        IN      NS      ns2.k57.com.

2       IN      PTR     erendis.k57.com.
3       IN      PTR     amdir.k57.com.

# tambahkan reverse zone di named.conf.local
nano /etc/bind/named.conf.local
# tambah file zona
zone "3.92.10.in-addr.arpa" {
    type master;
    file "/etc/bind/k57/3.92.10.in-addr.arpa";
    allow-transfer { 10.92.3.3; };
};

# cek dan restart bind9
named-checkzone 3.92.10.in-addr.arpa /etc/bind/k57/3.92.10.in-addr.arpa
service bind9 restart

# in amdir (ns2 slave)
# buat file
nano /etc/bind/named.conf.local
# tambah file zona
zone "3.92.10.in-addr.arpa" {
    type slave;
    masters { 10.92.3.2; };
    file "/var/lib/bind/3.92.10.in-addr.arpa";
};

# restart bind9
service bind9 restart

# testing di elendil atau salah satu node

# tes alias
dig @10.92.3.2 www.k57.com

# tes reverse
dig @10.92.3.2 -x 10.92.3.2
dig @10.92.3.2 -x 10.92.3.3

# tes TXT record
dig @10.92.3.2 elros.k57.com TXT
dig @10.92.3.2 pharazon.k57.com TXT
