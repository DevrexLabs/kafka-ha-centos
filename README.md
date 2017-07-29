# Setting up Kakfa HA cluster on CentOS 7.3

Deploy an N-node kafka kluster using SSH. See deploy.sh for details.

## Requirements
* root ssh access to the nodes

## Configuration 
* Modify deploy.sh to adjust the number of nodes and host name templates.
* Modify the list of servers in zoo.cfg
* Modify the zookeeper.connect setting in server.properties


## Versions
Zookeeper 3.4.10
Kafka 0.11.0.0

## RPMs
The RPMS are prebuilt with:
* https://github.com/id/zookeeper-el7-rpm
* https://github.com/id/kafka-el7-rpm