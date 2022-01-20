# SYTEMINFO

df
free -h
swapon

# LINUX MINT

read -p "Install updates? [y/n] " yn
case $yn in
    [Yy] )
    sudo apt update
    sudo apt upgrade -y 
    sudo apt dist-upgrade -y
    sudo apt autoremove
    sudo apt autoclean
    ;;
esac

# REMOVE
read -p "Uninstall unused apps? [y/n] " yn
case $yn in
    [Yy] )
    sudo apt remove thunderbird  thunderbird-gnome-support -y
    ;;
esac

# NETWORKTOOLS
read -p "Install networktools? [y/n] " yn
case $yn in
    [Yy] )
    sudo apt install -y traceroute
    sudo apt install -y nmap
    sudo apt install -y iftop
    ;;
esac

read -p "Install wireshark? [y/n] " yn
case $yn in
    [Yy] )
    sudo apt install -y wireshark
    ;;
esac

# FIREWALL

read -p "Install firewall? [y/n] " yn
case $yn in
    [Yy] )
    sudo apt install -y ufw
    sudo ufw logging on
    sudo ufw logging medium
    sudo ufw enable
    sudo ufw status verbose
    # sudo ufw allow 80,443,25,587,465,143,993/tcp
    # cat /var/log/ufw.log
    ;;
esac


# CHROME
read -p "Install chrome? [y/n] " yn
case $yn in
    [Yy] )
    sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
    sudo apt update
    sudo apt install -y google-chrome-stable
    ;;
esac

# VSCODE
read -p "Install vscode? [y/n] " yn
case $yn in
    [Yy] )
    sudo apt install -y wget apt-transport-https
    sudo apt update
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    cat  /etc/apt/sources.list.d/vscode.list
    sudo apt update 
    sudo apt install -y code
    ;;
esac

# VLC
read -p "Install vlc? [y/n] " yn
case $yn in
    [Yy] )
    sudo apt install -y vlc
    ;;
esac

# RETROARCH
read -p "Install retroarch? [y/n] " yn
case $yn in
    [Yy] )
    sudo add-apt-repository ppa:libretro/stable && sudo apt-get update && sudo apt-get install retroarch
    ;;
esac

# JOYCON
read -p "Install joycond? [y/n] " yn
case $yn in
    [Yy] )
    cd ~/Downloads
    git clone https://github.com/nicman23/dkms-hid-nintendo
    cd dkms-hid-nintendo
    sudo dkms add .
    sudo dkms build nintendo -v 3.2
    sudo dkms install nintendo -v 3.2
    
    cd ~/Downloads
    sudo git clone https://github.com/DanielOgorchock/joycond
    cd joycond
    sudo apt install -y libevdev-dev libudev-dev
    sudo cmake .
    sudo make install
    sudo systemctl enable --now joycond
    cd ~
    ;;
esacsudo apt install steam-installer

# STEAM
read -p "Install steam? [y/n] " yn
case $yn in
    [Yy] )
    sudo apt install steam-installer
    ;;
esac

# REMMINA
read -p "Install remmina? [y/n] " yn
case $yn in
    [Yy] )
    sudo apt install -y remmina
    ;;
esac

# FIX MOUSE FREEZE
read -p "Fix mouse freeze on lenovo? [y/n] " yn
case $yn in
    [Yy] )
    cd /lib/systemd/system-sleep
    sudo wget https://raw.githubusercontent.com/M1sterGlass/Linux/main/fixmousefreeze.sh
    sudo chmod +x fixmousefreeze.sh
    cd ~
    ;;
esac



# /etc/default/grub
# quiet splash psmouse.synaptics_intertouch=1"



