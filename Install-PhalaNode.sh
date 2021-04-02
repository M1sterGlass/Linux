# PREREQ
sudo apt install -y intel-microcode
sudo apt install -y unzip dkms docker docker-compose jq

cd
mkdir phala
cd phala

# NOTEBOOK

sudo wget https://download.01.org/intel-sgx/latest/linux-latest/distro/ubuntu20.04-server/sgx_linux_x64_driver_2.11.0_0373e2e.bin
sudo chmod +x sgx_linux_x64_driver_2.11.0_0373e2e.bin
sudo ./sgx_linux_x64_driver_2.11.0_0373e2e.bin
ls /dev/isgx
#/opt/intel/sgxdriver/unistall.sh

# DCAP

wget https://download.01.org/intel-sgx/latest/dcap-latest/linux/distro/ubuntu20.04-server/sgx_linux_x64_driver_1.41.bin
sudo chmod +x sgx_linux_x64_driver_1.41.bin
sudo ./sgx_linux_x64_driver_1.41.bin
ls /dev/isgx

# PHALA

sudo wget https://github.com/Phala-Network/solo-mining-scripts/archive/refs/heads/main.zip
sudo unzip main.zip
cd solo-mining-scripts-main
sudo chmod +x *.sh
sudo ./install.sh en
sudo phala sgx-test

lscpu

ls /opt/phala
sudo nano /opt/phala/config.json



# https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00334.html
# isvEnclaveQuoteStatus = CONFIGURATION_AND_SW_HARDENING_NEEDED
# isvEnclaveQuoteStatus unexpected.
# advisoryURL = https://security-center.intel.com
# advisoryIDs = "INTEL-SA-00161", "INTEL-SA-00219", "INTEL-SA-00289", "INTEL-SA-00334"

sudo phala install init




