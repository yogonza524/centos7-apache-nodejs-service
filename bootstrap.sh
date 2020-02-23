#!/usr/bin/env bash

yum update
yum install -y httpd
systemctl start httpd
systemctl enable httpd

#Install curl
yum install -y curl

#Instal vim
yum install -y vim

#Install nodejs
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
yum install -y nodejs

#Install Git
yum install -y git

#Install NodeJs project sample
git clone https://github.com/contentful/the-example-app.nodejs.git
mv the-example-app.nodejs nodejs-app

#Create a runner for NodeJs project
cat >> runner.sh <<EOL
#!/usr/bin/env bash

cd /home/vagrant/nodejs-app
npm install
npm run start:dev
EOL

chmod +x runner.sh
mv runner.sh /home/vagrant/nodejs-app

#Create a custom service
cat >> nodejs-app.service <<EOL
[Unit]
Description=NodeJS Application Service

[Service]
Type=simple
User=root
ExecStart= /home/vagrant/nodejs-app/runner.sh
Restart=on-abort


[Install]
WantedBy=multi-user.target
EOL

mv nodejs-app.service /etc/systemd/system/nodejs-app.service
systemctl enable nodejs-app.service
systemctl daemon-reload
systemctl start nodejs-app
