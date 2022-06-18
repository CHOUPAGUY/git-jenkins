#!/bin/bash

    #Author : Guy Landry
    #Date : 18-Jun-2022

## script for inatallation jenkins package

# Installation java

yum install java-1.8.0-openjdk-devel

# Enable the jenkins repository

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo 

# Disable key check on the repo

sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

# Installation the latest stable version of Jenkins

yum install jenkins -y

# Start the jenkins  service

systemctl start jenkins

# Check the jenkins status

systemctl status jenkins

# Adjust the firewall

firewall-cmd --permanent --zone=public --add-port=8080/tcp

firewall-cmd --reload
