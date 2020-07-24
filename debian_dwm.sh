#!/bin/bash
# dwm for dummies
# auto configure and install dwm on a minimal debian machine

# apt install all "essential" packages
echo "dwm-for-dummies"
sudo apt update; sudo apt install vim git build-essential wget curl alsa-utils acpi wicd-curses xinit libx11-dev libxft-dev libxinerama-dev xclip xvkbd xinput xbacklight feh figlet

#wget all packages
wget https://dl.suckless.org/dwm/dwm-6.2.tar.gz
wget https://dl.suckless.org/st/st-0.8.1.tar.gz
wget https://dl.suckless.org/tools/dmenu-4.9.tar.gz

# install dwm
tar -xvf dwm*
cd dwm-6.2
make
# change modkey from alt to windows key
sed -i 's,#define MODKEY Mod1Mask,#define MODKEY Mod4Mask,g' config.h
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

# update xorg.conf for backlight settings
sudo cp xorg.conf /etc/X11/xorg.conf

# populate dotiles
echo "
Setting up $USER's dotfiles in $HOME"

cp .xinitrc ~/
cp .vimrc ~/
cp .bash_aliases ~/
cp .bash_functions ~/

"if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi > > ~/.bashrc" >> ~/.bashrc

# done!
figlet DONE!
echo "type 'startx' to enter dwm environment"
