# In Aldarion

nano /etc/dhcp/dhcpd.conf

# Ubah waktu lease pada masing-masing subnet
# isinya

authoritative;

# Subnet Keluarga Manusia
subnet 10.92.1.0 netmask 255.255.255.0 {
    range 10.92.1.6 10.92.1.34;
    range 10.92.1.68 10.92.1.94;
    option routers 10.92.1.1;
    option broadcast-address 10.92.1.255;
    option domain-name-servers 192.168.122.1;
    default-lease-time 1800;    # 30 menit
    max-lease-time 3600;        # 1 jam
}

# Subnet Keluarga Peri
subnet 10.92.2.0 netmask 255.255.255.0 {
    range 10.92.2.35 10.92.2.67;
    range 10.92.2.96 10.92.2.121;
    option routers 10.92.2.1;
    option broadcast-address 10.92.2.255;
    option domain-name-servers 192.168.122.1;
    default-lease-time 600;     # 10 menit (1/6 jam)
    max-lease-time 3600;        # 1 jam
}

# Subnet Kurcaci (Khamul)
subnet 10.92.3.0 netmask 255.255.255.0 {
    option routers 10.92.3.1;
    option broadcast-address 10.92.3.255;
    option domain-name-servers 192.168.122.1;
}

# Subnet Server (Aldarion)
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

# restart service
service isc-dhcp-server restart
# kalau direstart failed bisa coba ini
dhcpd -t
mkdir -p /var/lib/dhcp
touch /var/lib/dhcp/dhcpd.leases
rm -f /var/run/dhcpd.pid
dhcpd -4 -d eth0

# tes dari client amandil
ip addr flush dev eth0
/tmp/gns3/bin/busybox udhcpc -i eth0 -v
