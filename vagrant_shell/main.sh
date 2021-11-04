#!/bin/bash

apt-get update
add-apt-repository ppa:pybricks/ppa
apt install -y git gettext uncrustify
curl -o $HOME/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
tar -xjvf gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 -C /opt/
su - vagrant
echo "export PATH=/opt/gcc-arm-none-eabi-10-2020-q4-major/bin:/home/vagrant/.local/bin:$PATH" > .bash_profile
source .bash_profile
git clone https://github.com/adafruit/circuitpython.git
cd circuitpython
git checkout 7.0.0
git submodule sync --quiet --recursive
git submodule update --init
sudo apt install -y python3-pip
pip3 install -r requirements-dev.txt
#pip3 install --upgrade click==7.1.2
make -C mpy-cross
sudo apt install -y ninja-build cmake
sudo apt install -y python-is-python3
cd ports/espressif
esp-idf/install.sh
source esp-idf/export.sh
make BOARD=espressif_saola_1_wrover

