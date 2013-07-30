release-ppa:
	sudo apt-get -y update && sudo apt-get -y install devscripts build-essential equivs
	sudo mk-build-deps -i
	yes | debuild -S