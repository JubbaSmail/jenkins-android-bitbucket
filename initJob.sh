#! /bin/bash
while [ ! -f /var/jenkins_home/secrets/initialAdminPassword ]; do sleep 2; done
echo password=$(cat /var/jenkins_home/secrets/initialAdminPassword) >> /etc/jenkins_jobs/jenkins_jobs.ini
sleep 10
jenkins-jobs update /opt/android_bitbucket.yml
echo "#####################################################"
printf ".\n.\n.\n.\n.\n"
echo "Jenkins is ready, Open the link http://"$(curl ifconfig.io)" via browser"
echo "Username: admin"
echo "Password: "$(cat /var/jenkins_home/secrets/initialAdminPassword)
