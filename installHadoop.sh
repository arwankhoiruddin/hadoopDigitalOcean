# Install JDK 8
sudo cp ./environment /etc/environment
sudo mkdir /usr/lib/jvm
cd /usr/lib/jvm
sudo tar -xvzf ~/jdk-8u221-linux-x64.tar.gz
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_221/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_221/bin/javac" 0
sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_221/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_221/bin/javac
echo "jdk 8 is installed"

# create hduser
adduser hduser
usermod -aG sudo hduser

# update bashrc
cd ~/hadoopDigitalOcean
pwd
cp ./bashrc ~/.bashrc
echo "bashrc is updated"

# update /etc/hosts
sudo cp ./hosts /etc/hosts
echo "etc hosts is updated"

# disable ipv6
sudo cp ./sysctl.conf /etc/sysctl.conf
sudo sysctl -p
echo "ipv6 disabled"

# make folders for datanode, namenode and temporary
mkdir -p /home/hduser/hdfs/tmp
mkdir -p /home/hduser/hdfs/datanode
mkdir -p /home/hduser/hdfs/namenode
sudo chown -R hduser:hduser /home/hduser/hdfs
sudo chmod -R 766 /home/hduser/hdfs
echo "directories needed by Hadoop are created"

# download hadoop
cd /usr/local/
curl -O https://archive.apache.org/dist/hadoop/core/hadoop-2.9.1/hadoop-2.9.1.tar.gz
tar xvfz hadoop-2.9.1.tar.gz
mv hadoop-2.9.1 hadoop
rm hadoop-2.9.1.tar.gz

# copy the files into the desired target
cd ~/hadoopDigitalOcean
cp ./*.xml /usr/local/hadoop/etc/hadoop/
cp hadoop-env.sh /usr/local/hadoop/etc/hadoop/
cp slaves /usr/local/hadoop/etc/hadoop/
sudo chown -R hduser:hduser /usr/local/hadoop/
echo "files have been copied. If you are working on master, copy masters into etc/hadoop folder"
sudo service ssh restart
