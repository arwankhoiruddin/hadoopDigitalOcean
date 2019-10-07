sudo cp ~/environment /etc/environment
sudo mkdir /usr/lib/jvm
cd /usr/lib/jvm
sudo tar -xvzf ~/jdk-8u221-linux-x64.tar.gz
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_221/bin/java" 0
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_221/bin/javac" 0
sudo update-alternatives --set java /usr/lib/jvm/jdk1.8.0_221/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/jdk1.8.0_221/bin/javac
