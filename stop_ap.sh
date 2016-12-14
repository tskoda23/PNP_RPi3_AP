#! /bin/bash
sudo /etc/init.d/hostapd stop
sudo /etc/init.d/udhcpd stop
sudo ifdown wlan0
sudo ifconfig wlan0 down
sudo rm -rf /etc/network/interfaces
sudo cp /etc/network/interfaces.orig /etc/network/interfaces
sudo ifconfig wlan0 up
sudo ifup wlan0