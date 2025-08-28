# 10moons-driver

Simpler driver for 10moons T503 tablet for linux (Based on Alexandr Vasilyev's project)

## About

Driver which provides basic functionality for 10moons T503 tablet:

- 4 buttons on the tablet itself
- Correct X and Y positioning
- Pressure sensitivity
- Systemd service and udev rules to run the driver when the tablet is connected (no need to manually call it anymore!)

Tablet has 4096 levels in both axes and 2047 levels of pressure.

## How to use

Clone or download this repository:

```bash
git clone https://github.com/reisaraujo-miguel/10moons-driver.git
```

Cd into the directory:

```bash
cd 10moons-driver
```

And run the installation script (it will ask for your sudo password):

```bash
./install.sh
```

If you're not on a Debian/Ubuntu, Fedora or ArchLinux based distro, you may need to install the python dependencies manually. You may use the requirements.txt file to install them with pip.

```bash
python -m pip install -r requirements.txt
```

Connect tablet to your computer and thats it. The driver should work automatically.

**You need to connect your tablet and run the driver prior to launching a drawing software otherwise the device will not be recognized by it.**

## Configuring tablet

Configuration of the driver placed in _config.yaml_ file (the file is located on _/etc/opt/10moons/config.yaml_ after installed).

You may need to change the _vendor_id_ and the _product_id_ but I'm not sure (You device can have the same values as mine, but if it is not you can run the _lsusb_ command to find yours).

Buttons assigned from in the order from left to right. You can assign to them any button on the keyboard and their combinations separating them with a plus (+) sign.

If you find that using this driver with your tablet results in reverse axis or directions (or both), you can modify parameters _swap_axis_, _swap_direction_x_, and _swap_direction_y_ by changing false to true and another way around.

To list all the possible key codes you may run:

```bash
python -c "from evdev import ecodes; print([x for x in dir(ecodes) if 'KEY' in x])"
```

## Credits

Some parts of code are taken from: https://github.com/Mantaseus/Huion_Kamvas_Linux
The driver itself was taken from: https://github.com/alex-s-v/10moons-driver.git

## Known issues

Buttons on the pen itself do not work and hence not specified. I don't know if it's the issue only on my device or it's a common problem.
