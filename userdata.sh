#!/bin/bash
export HOME=/root

# install Git and PHP
yum update && \
amazon-linux-extras enable php7.4 && \
amazon-linux-extras install -y php7.4
yum install -y git

# install and setup Composer
# ref: https://getcomposer.org/download/
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

# fetch source code
git clone https://github.com/TowaYamashita/sandbox-composer-install-on-userdata.git /home/ec2-user/sample
mv /home/ec2-user/sample/example /home/ec2-user
rm -rf /home/ec2-user/sample

# install package
composer install --no-dev -o -d /home/ec2-user/example

php -f /home/ec2-user/example/index.php > /home/ec2-user/example/result.log
