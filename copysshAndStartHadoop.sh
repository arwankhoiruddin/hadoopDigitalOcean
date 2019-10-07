ssh-keygen -t rsa -P ""
ssh-copy-id -i ~/.ssh/id_rsa.pub hduser@hadoop1
ssh-copy-id -i ~/.ssh/id_rsa.pub hduser@hadoop2
ssh-copy-id -i ~/.ssh/id_rsa.pub hduser@hadoop3
ssh-copy-id -i ~/.ssh/id_rsa.pub hduser@hadoop4
ssh 0.0.0.0

echo 'starting hadoop now'

echo 'hadoop1' > $HADOOP_HOME/etc/hadoop/masters
hadoop namenode -format
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh --config $HADOOP_HOME/etc/hadoop start historyserver
jps
