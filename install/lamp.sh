#export DEBIAN_FRONTEND=noninteractive
echo "update & upgrade"
sudo apt update -y > /dev/null
sudo apt upgrade -y > /dev/null

echo "install ondrej repo"
sudo apt install software-properties-common ca-certificates lsb-release apt-transport-https -y > /dev/null
LC_ALL=C.UTF-8 sudo add-apt-repository ppa:ondrej/php 

echo "install apache2"
sudo apt install apache2 -y > /dev/null
sudo rm /var/www/html/index.html > /dev/null

echo "install php8.1"
sudo apt install php8.1 php8.1-mysql php8.1-mbstring libssh2-1 php-ssh2 -y > /dev/null
sudo sed -i -r -e 's/display_errors = Off/display_errors = On/g' /etc/php/8.1/apache2/php.ini
sudo systemctl restart apache2 > /dev/null

echo "Installing MySQL"
echo "mysql-server mysql-server/root_password password secret" | sudo debconf-set-selections  > /dev/null
echo "mysql-server mysql-server/root_password_again password secret" | sudo debconf-set-selections  > /dev/null
sudo apt -y install mysql-server  > /dev/null
sudo sed -i -r -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql > /dev/null

echo "Done setting mysql password."
echo "Vagrant finished"