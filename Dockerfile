FROM jenkins

USER root
RUN /usr/local/bin/install-plugins.sh bitbucket gradle envinject 
#artifactdeployer
RUN apt-get update && apt-get install -y wget git-core python-setuptools python-pip
RUN mkdir -p /opt/android-sdk-linux && cd /opt/android-sdk-linux &&  wget https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
RUN cd /opt/android-sdk-linux && ls -la && unzip tools_r25.2.3-linux.zip
RUN echo "export ANDROID_HOME=\"/opt/android-sdk-linux\"" >> /etc/profile.d/android.sh
RUN echo "export PATH=\"$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH\"" >> /etc/profile.d/android.sh
RUN . /etc/profile
RUN mkdir -p "/opt/android-sdk-linux/licenses"
RUN echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "/opt/android-sdk-linux/licenses/android-sdk-license"
RUN echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "/opt/android-sdk-linux/licenses/android-sdk-preview-license"
RUN (while sleep 3; do echo "y"; done) | /opt/android-sdk-linux/tools/android update sdk -u --filter platform-tools,android-25
RUN chmod -R 755 /opt/android-sdk-linux
RUN cd /opt
RUN git clone https://github.com/openstack-infra/jenkins-job-builder.git
RUN cd jenkins-job-builder && python setup.py install
RUN pip install pbr six PyYAML stevedore python-jenkins multi-key-dict
RUN pip install --user jenkins-job-builder
COPY jenkins_jobs.ini /etc/jenkins_jobs/jenkins_jobs.ini
COPY android_bitbucket.yml /opt/android_bitbucket.yml
COPY initJob.sh /opt/initJob.sh
RUN chmod +x /opt/initJob.sh
RUN echo "-----##-#-------DONE-----------##-#------"
