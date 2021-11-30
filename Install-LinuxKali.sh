 SYTEMINFO

df
free -h
swapon

# UPDATES

read -p "Install updates? [y/n] " yn
case $yn in
    [Yy] )
    sudo apt update
    sudo apt upgrade -y
    sudo apt full-upgrade -y
    sudo apt dist-upgrade -y
    sudo apt autoremove
    sudo apt autoclean
    ;;
esac


read -p "Enable virtualbox USB passtrough? [y/n] " yn
case $yn in
    [Yy] )
    echo "Run on host machine:"
    echo "####################"
    echo "sudo adduser $USER vboxusers"
    echo "sudo usermod -a -G vboxusers $USER" 
    ;;
esac

# WIFITE

read -p "Install wifite? [y/n] " yn
case $yn in
    [Yy] )

    sudo apt-get install libcurl4-openssl-dev libssl-dev zlib1g-dev libpcap-dev -y
    sudo apt install hcxtools -y

    git clone https://github.com/JPaulMora/Pyrit.git
    sudo apt-get install python3 python3-pip libpcap-dev python2-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev zlib1g-dev -y
    cd Pyrit
    sudo python setup.py clean
    sudo python setup.py build   
    sudo python setup.py install
    ;;
esac
