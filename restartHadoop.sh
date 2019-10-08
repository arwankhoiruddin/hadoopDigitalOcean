echo 'stopping hadoop'
/usr/local/hadoop/sbin/stop-dfs.sh
/usr/local/hadoop/sbin/stop-yarn.sh
/usr/local/hadoop/sbin/mr-jobhistory-daemon.sh --config /usr/local/hadoop/etc/hadoop stop historyserver

echo 'deleting hdfs in hadoop1'
rm -rf ~/hdfs/namenode/*
rm -rf ~/hdfs/datanode/*
rm -rf ~/hdfs/tmp/*

echo 'deleting hdfs folder in hadoop2'
ssh -t hduser@hadoop2 'rm -rf ~/hdfs/namenode/*'
ssh -t hduser@hadoop2 'rm -rf ~/hdfs/datanode/*'
ssh -t hduser@hadoop2 'rm -rf ~/hdfs/tmp/*'

echo 'deleting hdfs folder in hadoop3'
ssh -t hduser@hadoop3 'rm -rf ~/hdfs/namenode/*'
ssh -t hduser@hadoop3 'rm -rf ~/hdfs/datanode/*'
ssh -t hduser@hadoop3 'rm -rf ~/hdfs/tmp/*'

echo 'deleting hdfs folder in hadoop4'
ssh -t hduser@hadoop4 'rm -rf ~/hdfs/namenode/*'
ssh -t hduser@hadoop4 'rm -rf ~/hdfs/datanode/*'
ssh -t hduser@hadoop4 'rm -rf ~/hdfs/tmp/*'

/usr/local/hadoop/sbin/start-dfs.sh
/usr/local/hadoop/sbin/start-yarn.sh
/usr/local/hadoop/sbin/mr-jobhistory-daemon.sh --config /usr/local/hadoop/etc/hadoop start historyserver
