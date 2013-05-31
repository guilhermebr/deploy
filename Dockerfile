from	ubuntu:12.10
maintainer Solomon Hykes <solomon@dotcloud.com>
run	echo 'deb http://archive.ubuntu.com/ubuntu quantal main universe multiverse' > /etc/apt/sources.list
run	apt-get update
# Install python
run	DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all
run	DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-pip
# Install app dependencies
run	pip install Flask
run	pip install GitPython
run	pip install config
# Upload source
add	. /
run	cp example.conf deploy.conf
run	mkdir -p /var/www/deploy
expose	80
cmd	["python", "deploy.py"]
