echo "Adding udev rules for device to /etc/udev/rules.d/10moons-device.rules"
sudo cp ./10moons-device.rules /etc/udev/rules.d/10moons-device.rules

echo "Addin systemd service file to /etc/systemd/system/10moons-driver.service"
sudo cp ./10moons-driver.service /etc/systemd/system/10moons-driver.service

echo "Copying driver files to /etc/opt/10moons/"
sudo mkdir -p /etc/opt/10moons/
sudo cp ./config.yaml /etc/opt/10moons/config.yaml
sudo cp ./driver.py /etc/opt/10moons/driver.py

echo "Installing required Python packages"
if [ -f /etc/arch-release ]; then
	# Arch Linux
	sudo pacman -S --noconfirm python-pyusb python-evdev python-yaml python-chardet
elif [ -f /etc/debian_version ]; then
	# Debian/Ubuntu
	sudo apt update
	sudo apt install -y python3-usb python3-evdev python3-yaml python3-chardet
elif [ -f /etc/fedora-release ]; then
	# Fedora
	sudo dnf install -y python3-pyusb python3-evdev python3-yaml python3-chardet
else
	echo "Unsupported Linux distribution. Please install the required packages manually: pyusb, evdev, pyyaml, chardet"
fi

# Reload udev rules
echo "Reloading udev rules"
sudo udevadm control --reload-rules
sudo udevadm trigger
