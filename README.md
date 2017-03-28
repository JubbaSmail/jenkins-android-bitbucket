# jenkins-android-bitbucket
Docker container to automatically install and configure Jenkins to build Android APK after every commit on BitBucket repository with a specific format

<img width="200" src="http://jenkins-ci.org/sites/default/files/jenkins_logo.png"/><img width="100" src="https://mir-s3-cdn-cf.behance.net/project_modules/disp/cc14679984981.560dd8d3aa5e4.png"/><img width="100" src="http://sdtimes.com/wp-content/uploads/2016/07/0722.sdt-atlassian.png"/>

# Building
clone the project to your directory

    git clone https://github.com/Ismail-AlJubbah/jenkins-android-bitbucket
edit the file `android_bitbucket.yml` under -git url paste your BitBucket Repository URL

    - git:
        url: [YOUR BitBucket Repository URL]
Then build the image

    docker build -t jubba/jenkins-android:latest .
# Running
Run this command to run the container 

    docker run -d -p 80:8080 -u=root --name jnks -v jenkins_home:/var/jenkins_home jubba/jenkins-android

Run this command to setup Jenkins job and get the admin password

    docker exec -it jnks /opt/initJob.sh
# Setting on your BitBucket


# Links
more information can be found on the following links:
   -[jenkinsci/docker offical docker image](https://github.com/jenkinsci/docker)
   -[Jenkins Job YMAL file definition](https://docs.openstack.org/infra/jenkins-job-builder/definition.html#modules)
   -[Do it your maually](https://www.digitalocean.com/community/tutorials/how-to-build-android-apps-with-jenkins)
   
