install-build-env:
	sudo apt-get -y update && sudo apt-get -y install devscripts build-essential
install-build-deps:
	sudo apt-get -y install equivs
	sudo mk-build-deps -i
import-ppa-key:
	gpg --import $$PPA_KEY_FILE
build-deb-package:
	yes | debuild -S -I -k`gpg --list-secret-keys --with-colons | grep sec | tail -n1 | cut -d':' -f5` -sgpg -p"gpg --passphrase $$PPA_KEY_PASSWORD"
upload-ppa:
	debrelease -S --dput ppa:$$PPA_NAME
release-ppa: install-build-env install-build-deps import-ppa-key build-deb-package upload-ppa
	
	
	
