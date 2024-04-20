#!/bin/bash
export COMPOSER_HOME=/root

# fetch source code
git clone https://github.com/TowaYamashita/sandbox-composer-install-on-userdata.git /home/ec2-user/sample
mv /home/ec2-user/sample/example /home/ec2-user
rm -rf /home/ec2-user/sample
chown -R ec2-user:ec2-user /home/ec2-user/example

# install package
sudo -u ec2-user $(which composer) install --no-dev -o -d /home/ec2-user/example

sudo -u ec2-user php -f /home/ec2-user/example/index.php > /home/ec2-user/example/result.log
