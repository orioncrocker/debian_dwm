#!/bin/bash
# debian dwm for dummies (like me)
# auto configure and install dwm on a minimal debian machine

if [ ! "$EUID" -ne 0 ]
    then echo "please don't run this script as root"
    exit
fi

# apt install all essential packages
sudo apt install -y rsync acpi build-essential sudo wget curl alsa-utils wicd-curses xinit libx11-dev libxft-dev libxinerama-dev xclip xvkbd feh figlet

#sudo wget all packages
if [ -d "packages" ]
then
    sudo rm -rf packages
fi
mkdir packages
cd packages
sudo wget https://dl.suckless.org/dwm/dwm-6.2.sudo tar.gz
sudo wget https://dl.suckless.org/st/st-0.8.1.sudo tar.gz
sudo wget https://dl.suckless.org/tools/dmenu-4.9.sudo tar.gz

# install dwm
sudo tar -xvf dwm*
cd dwm-6.2
make
sudo make install
cd ..

# install st
sudo tar -xvf st*
cd st-0.8.1
make
sudo make install
cd ..

# install dmenu
sudo tar -xvf dmenu*
cd dmenu-4.9
make
sudo make install
cd ..

# cleaning up the mess
sudo rm -rf *.sudo tar.gz
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
echo "type 'ssudo tartx' to enter dwm environment"
