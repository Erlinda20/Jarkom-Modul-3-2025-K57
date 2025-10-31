# in aldarion

# install DHCP server
apt update && apt install isc-dhcp-server -y

# Menentukan interface yang digunakan DHCP server
nano /etc/default/isc-dhcp-server
# isinya
INTERFACESv4="eth0"
INTERFACESv6=""

# konfigurasi dhcpd.conf
nano /etc/dhcp/dhcpd.conf
# isinya
authoritative;

# Subnet Manusia
subnet 10.92.1.0 netmask 255.255.255.0 {
    range 10.92.1.6 10.92.1.34;
    range 10.92.1.68 10.92.1.94;
    option routers 10.92.1.1;
    option broadcast-address 10.92.1.255;
    option domain-name-servers 192.168.122.1;
    default-lease-time 600;
    max-lease-time 7200;
}

# Subnet Peri
subnet 10.92.2.0 netmask 255.255.255.0 {
    range 10.92.2.35 10.92.2.67;
    range 10.92.2.96 10.92.2.121;
    option routers 10.92.2.1;
    option broadcast-address 10.92.2.255;
    option domain-name-servers 192.168.122.1;
    default-lease-time 600;
    max-lease-time 7200;
}

# Subnet Kurcaci (Khamul)
subnet 10.92.3.0 netmask 255.255.255.0 {
    option routers 10.92.3.1;
    option broadcast-address 10.92.3.255;
    option domain-name-servers 192.168.122.1;
}

# Subnet Aldarion (Server)
subnet 10.92.4.0 netmask 255.255.255.0 {
    range 10.92.4.10 10.92.4.50;
    option routers 10.92.4.1;
    option broadcast-address 10.92.4.255;
    option domain-name-servers 192.168.122.1;
}

# Fixed Address Khamul
host Khamul {
    hardware ethernet 02:42:e4:f0:67:00;  # MAC address Khamul
    fixed-address 10.92.3.95;
}

# jalankan DHCP server
service isc-dhcp-server stop
rm -f /var/run/dhcpd.pid
service isc-dhcp-server start

# kalau direstart failed bisa coba ini
dhcpd -t
mkdir -p /var/lib/dhcp
touch /var/lib/dhcp/dhcpd.leases
rm -f /var/run/dhcpd.pid
dhcpd -4 -d eth0


# in Durin
# install DHCP relay
apt update && apt install isc-dhcp-relay -y

nano /etc/default/isc-dhcp-relay
# isinya
SERVERS="10.92.4.2"
INTERFACES="eth1 eth2 eth3 eth4 eth5"
OPTIONS=""

# aktifkan IP forwading
apt-get update && apt-get install procps -y
nano /etc/sysctl.conf
# tambahkan
net.ipv4.ip_forward=1
# lalu jalankan
sysctl -p

# jalankan di durin juga
dhcrelay -d 10.92.4.2 eth1 eth2 eth3 eth4 eth5

# di Khamul
ip addr flush dev eth0
/tmp/gns3/bin/busybox udhcpc -i eth0 -v
