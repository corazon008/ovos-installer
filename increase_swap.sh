echo "Increasing swap size for Pi3B+ and Pi4-2g..."
sudo sed -i 's/^CONF_SWAPSIZE=.*/CONF_SWAPSIZE=1024/' /etc/dphys-swapfile
sudo systemctl restart dphys-swapfile