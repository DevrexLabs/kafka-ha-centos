# Setting up Kakfa HA cluster on CentOS

## Prerequisites

* CentOS 7.3
* firewalld disabled

### TCP Ports
* Kafka: 9092
* Zookeeper: 2181, 2888, 3888


## Install Java, download
```bash
sudo yum update -y
sudo yum install wget java-1.8.0-openjdk.x86_64 -y
```

* Download and install RPM's 

Installing these RPMs will setup zookeeper and kafka as standalone services.

```
wget -O zookeeper.rpm 
wget -O kafka.rpm

sudo mkdir /opt/kafka
sudo mkdir /opt/zookeeper
sudo yum install zookeeper.rpm
sudo yum install kafka.rpm
```

## Configure zookeeper
On each node modify the zookeeper config adding each server to the list of servers
```
$ vi config/zookeeper.properties
# The number of milliseconds of each tick
tickTime=2000
  
# The number of ticks that the initial synchronization phase can take
initLimit=10
  
# The number of ticks that can pass between 
# sending a request and getting an acknowledgement
syncLimit=5

dataDir=/var/zookeeper

# zoo servers, host names of all zookeeper servers
server.1=eht-kafka-p01:2888:3888
server.2=eht-kafka-p02:2888:3888
server.3=eht-kafka-p03:2888:3888
```

## Create id file, use correct id in place of &lt;ID&gt;
```
mkdir /var/zookeeper
echo <PID> | sudo tee /var/zookeeper/myid
```

## Configure kafka
Modify the zookeeper.connect property to point at all the zookeeper nodes.
ensure unique broker id per node!. 
```
$ vi config/server.properties
broker.id=1 //Increase by one as per node count
zookeeper.connect=x.x.x.x:2181,x.x.x.x:2181,x.x.x.x:2181
```

## Start the services
```

```

# References