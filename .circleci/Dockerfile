## This image is used to build www.thewallsproject.org on CircleCI
## Find it on Docker Hub at thefuturesfund/walls-site-circleci
FROM circleci/ruby:2.5.0

# Install the AWS CLI
RUN sudo apt-get -y update
RUN sudo apt-get -y install python-pip python-dev
RUN sudo pip install --upgrade pip
RUN sudo pip install awscli
