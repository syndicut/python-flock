release-ppa:
	sudo apt-get -y update && sudo apt-get -y install devscripts build-essential equivs
	sudo mk-build-deps -i
	gpg --import .travis/ppa-key.gpg
	export DEBSIGN_KEYID=`gpg --list-secret-keys --with-colons | grep sec | tail -n1 | cut -d':' -f5`
	env | grep DEB >> ~/.devscripts
	yes | debuild -S -I
	rm ~/.devscripts
	debrelease -S --dput ppa:syndicut/python-flock
