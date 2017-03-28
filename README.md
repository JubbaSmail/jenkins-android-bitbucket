# Jenkins Android Bitbucket auto build on each commit
Docker container to automatically install and configure Jenkins to build Android APK after each commit on BitBucket repository with a specific format

<img width="300" src="http://jenkins-ci.org/sites/default/files/jenkins_logo.png"/><img width="110" src="https://mir-s3-cdn-cf.behance.net/project_modules/disp/cc14679984981.560dd8d3aa5e4.png"/><img width="100" src="http://sdtimes.com/wp-content/uploads/2016/07/0722.sdt-atlassian.png"/>

# Building
Clone the project to your directory
```bash
git clone https://github.com/Ismail-AlJubbah/jenkins-android-bitbucket
```
Edit the file `android_bitbucket.yml` under -git url paste your BitBucket Repository URL
```yml
- git:
    url: [YOUR BitBucket Repository URL]
```
Then build the image
```bash
docker build -t jubba/jenkins-android:latest .
```
# Running
Run this command to run the container 
```bash
docker run -d -p 80:8080 -u=root --name jnks -v jenkins_home:/var/jenkins_home jubba/jenkins-android
```
Run this command to setup Jenkins job and get the admin password
```bash
docker exec -it jnks /opt/initJob.sh
```
# Setting on your BitBucket Repo
Go to your BitBucket reposotoriy Settings -> Webhook, input the title and the url as `http://YOUR-Jenkins-Public-IP/bitbucket-hook/` then save
<img src="http://static.imljh.com/bitbucket.png">
# Testing
Commit and Push new changes on your Andriod project on BitBucket and you should see new build running on Jenkins Job, the new generated APK should found on `Last Successful Deployed Artifacts` with the following format `date:time_build-number.apk`
<img src="http://static.imljh.com/jenkins_job.png">
# Links
More information can be found on the following links:

1. [Jenkinsci offical docker image](https://github.com/jenkinsci/docker)
2. [Jenkins job ymal file definition](https://docs.openstack.org/infra/jenkins-job-builder/definition.html#modules)
3. [BitBucket: build after each commit](https://www.youtube.com/watch?v=nNaR5Q_pIa4)
4. [Do it yourself maually](https://www.digitalocean.com/community/tutorials/how-to-build-android-apps-with-jenkins)
 
   
