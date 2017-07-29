


# download the installer
curl -O https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh

# generate the configuration
sudo bash dcos_generate_config.sh --genconf

# install cluster prerequisites on the nodes
sudo bash dcos_generate_config.sh --install-prereqs




