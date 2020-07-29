#!/bin/bash
# debian dwm for dummies (like me)
# auto configure and install dwm on a minimal debian machine

if [ ! "$EUID" -ne 0 ]
    then echo "please don't run this script as root"
    exit
fi

# apt install all essential packages
sudo apt install -y rsync acpi build-essential wget curl alsa-utils wicd-curses xinit libx11-dev libxft-dev libxinerama-dev xclip xvkbd feh figlet

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
cd ..

# update xorg.conf.d for backlight and mouse functionality
echo ""
if [ "$(acpi)" == "" ];
    then echo "no battery detected, skipping step"
    else echo "battery detected, copying xorg files to /etc/X11"
    sudo apt install xinput xbacklight
    sudo rsync -r xorg.conf.d /etc/X11
    exit
fi

# populate dotiles
echo "
Setting up $USER's dotfiles in $HOME"
rsync -r dotfiles/ ~/
rsync -r images ~/

# done!
figlet done!
echo "type 'startx' to enter dwm environment"
