# Dockerfile for deuce-dev-env

FROM            vamsee/sqlite3
MAINTAINER      Malini and Sriram <malini.kamalambal@rackspace.com> <sriram.madapusivasud@rackspace.com>

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -y update

# Add mongo repo
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get -y update

# Set up env for mongo
RUN mkdir -p /data/db

# Install requirements
RUN apt-get -y install mongodb-10gen python-pip python-dev git gcc make vim-nox emacs openssh-server

# Install test-requirements
RUN pip install coverage nose testtools setuptools>=1.1.6 pep8 sentinels mongomock

# Install deuce
RUN pip install pecan six
RUN git clone https://github.com/rackerlabs/deuce
RUN pip install -e git+https://github.com/rackerlabs/deuce#egg=deuce
ADD /doit.sh /

RUN chmod +x /doit.sh
# Open up the required ports for API access
EXPOSE 8080 27017

# Do it!
ENTRYPOINT ["./doit.sh"]
