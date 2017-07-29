## Deploy DCOS cluster using the CLI method

Semi-scripted install of DCOS according to this procedure: https://dcos.io/docs/1.9/installing/custom/cli/

## Prerequisites
* IP / hostnames to all the nodes
* Nodes should meet the requirements here: https://dcos.io/docs/1.9/installing/custom/system-requirements/
* Logged on to the bootstrap node
* root ssh access to all the nodes
* A passwordless private ssh key
* Docker is installed on the bootstrap node


## Configure 
Modify the config.yaml script, specifically:
* cluster_name
* List of private agents
* List of public agents
* List of master nodes 
* Consider oauth
* Consider dns resolvers, default is google dns

## Steps
* Run the genconf/ipdetect script and ensure it returns the ip of the default ethernet interface
* Run the genconf/ipdetect-public script and ensure it returns the public ip of the default ethernet interface
* Copy private ssh key to the dcos/genconf folder in this repository, name it ssh_key
* Run the deploy.sh script which downloads and generates the installer and installs prerequisites on the nodes
* In order to proceed, the previous step must not fail. If it fails, examine the output to determine the cause. 
  If timeouts then you can try running the prerequisites phase again using `sudo bash dcos_generate_config.sh --install-prereqs`
* Run the preflight validation phase: `sudo bash dcos_generate_config.sh --preflight`
* If good then do the actual deployment: `sudo bash dcos_generate_config.sh --deploy`
* Post validation phase: `sudo bash dcos_generate_config.sh --postflight`
* Login to the DC/OS UI