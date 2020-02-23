# centos7-apache-nodejs-service
DevOps example using Vagrant &amp; NodeJS as a Service

## Requiriments
1. Vagrant 2.2.7
2. VirtualBox 6.1

## Usage
run next command
```bash
vagrant up
```
Connect to the host using
```bash
vagrant ssh
```
Verify if server is running using
```bash
systemctl status nodejs-app.service
```
Go to yout browser at 
```bash
http://192.168.0.17:3000
```

### Enjoy
