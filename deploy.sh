
# P for production, D for dev, T for test, etc
env_abbr=p

for N in 1 2 3 
do

NODE=EHT-KAFKA-P0$N

#copy rpms
scp kafka.rpm zookeeper.rpm $NODE:/root
ssh $NODE mkdir /opt/kafka /opt/zookeeper /var/kafka /var/zookeeper

ssh $NODE yum install kafka.rpm -y
ssh $NODE yum install zookeeper.rpm -y
ssh $NODE chown kafka:kafka /var/kafka
ssh $NODE chown zookeeper:zookeeper /var/zookeeper

#copy myid
echo $N > myid
scp myid $NODE:/var/zookeeper/myid
rm -f myid

#copy server properties
cat server.properties | sed s/%ID%/$N/ > server.properties.tmp
scp server.properties.tmp $NODE:/etc/kafka/server.properties
rm -f server.properties.tmp

#copy zookeeper config
cat zoo.cfg | sed s/%ENV%/$env_abbr/g > zoo.cfg.tmp
scp zoo.cfg.tmp $NODE:/etc/zookeeper/zoo.cfg
rm -f zoo.cfg.tmp

done

for N in 1 2 3
do
#enable and start services
ssh $NODE systemctl enable zookeeper
ssh $NODE systemctl start zookeeper
ssh $NODE systemctl enable kafka
ssh $NODE systemctl start kafka
done
