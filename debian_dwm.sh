#!/bin/sh
# debian dwm for dummies (like me)
# auto configure and install dwm on a minimal debian machine

echo "
************************************
MAKE SURE TO RUN THIS SCRIPT AS SUDO
************************************
"

# apt install all essential packages
sudo apt install build-essential wget curl alsa-utils acpi wicd-curses xinit libx11-dev libxft-dev libxinerama-dev xclip xvkbd xinput xbacklight feh figlet

#wget all packages
if [ -d "packages" ]
then
    sudo rm -rf packages
fi
mkdir packages
cd packages
wget https://dl.suckless.org/dwm/dwm-6.2.tar.gz
wget https://dl.suckless.org/st/st-0.8.1.tar.gz
wget https://dl.suckless.org/tools/dmenu-4.9.tar.gz

# install dwm
tar -xvf dwm*
cd dwm-6.2
make

patch config.h -i ../../*.patch

sudo make install
cd ..

# install st
tar -xvf st*
cd st-0.8.1
make
sudo make install
cd ..

# install dmenu
tar -xvf dmenu*
cd dmenu-4.9
make
sudo make install
cd ..

# cleaning up the mess
sudo rm -rf *.tar.gz
cd ../..

# update xorg.conf.d for backlight and mouse functionality
sudo cp -r xorg.conf.d /etc/X11

# populate dotiles
echo "
Setting up $USER's dotfiles in $HOME"
cp -rT dotfiles $HOME
cp -r images $HOME

# done!
figlet done!
echo "type 'startx' to enter dwm environment"
