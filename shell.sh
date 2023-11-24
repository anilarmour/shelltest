curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
dnf module disable mysql
yum install mysql-community-server -y
systemctl enable mysqld
systemctl start mysqld

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'RoboShop@1';" > /tmp/errormes

head=$(grep 'A temporary' /var/log/mysqld.log | awk '{print $11}')
cat /tmp/errormes | mysql --connect-expired-password -uroot -p"{head}"