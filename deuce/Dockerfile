FROM		vamsee/sqlite3
MAINTAINER 	Malini and Sriram <malini.kamalambal@rackspace.com> <sriram.madapusivasud@rackspace.com>

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -y update

# Install sqlite
RUN apt-get -y install sqlite libsqlite3-dev 

# Install requirements
RUN apt-get -y install python-pip python-dev git gcc make vim-nox emacs openssh-server

# Install test-requirements
RUN pip install coverage nose testtools setuptools>=1.1.6 pep8 sentinels mongomock 

# Install deuce
RUN pip install pecan six
RUN git clone https://github.com/rackerlabs/deuce
RUN pip install -e git+https://github.com/rackerlabs/deuce#egg=deuce

ADD /doit.sh /
RUN chmod +x /doit.sh

# Open up the required ports for API access
EXPOSE 8080

# Do it!
ENTRYPOINT ["./doit.sh"]
