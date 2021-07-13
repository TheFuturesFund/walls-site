## This image is used to build www.thewallsproject.org on CircleCI
## Find it on Docker Hub at thefuturesfund/walls-site-circleci
FROM circleci/ruby:2.5.0

# Install imagemagick.
RUN sudo apt -y install libmagickwand-dev imagemagick

# Install Python.
RUN sudo apt -y update
RUN sudo apt -y install python-pip python-dev

# Upgrade Python's package manager to the latest version.
RUN sudo pip install --upgrade pip

# Install the AWS Python CLI.
RUN sudo pip install awscli
