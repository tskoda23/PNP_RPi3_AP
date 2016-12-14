#! /bin/bash
sudo sed -i -e "s/\(ssid=\).*/\1$1/" /etc/hostapd/hostapd.conf
sudo /etc/init.d/hostapd stop
sudo /etc/init.d/udhcpd stop
sudo ifdown wlan0
sudo ifconfig wlan0 down
sudo cp /etc/network/interfaces /etc/network/interfaces.orig
sudo rm -rf /etc/network/interfaces
sudo cp /etc/network/interfaces.ap /etc/network/interfaces
sudo ifconfig wlan0 up
sudo ifup wlan0
sudo /etc/init.d/hostapd restart
sudo /etc/init.d/udhcpd restart
sudo service hostapd status