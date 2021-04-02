sudo apt update
sudo apt -y upgrade 
sudo apt -y autoremove

# VSCODE

sudo apt -y install wget apt-transport-https
sudo apt update
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
cat  /etc/apt/sources.list.d/vscode.list
sudo apt update 
sudo apt install code


