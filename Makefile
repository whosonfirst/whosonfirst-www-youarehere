templates:

	php -q ./bin/compile-templates.php

secret:
	php -q ./bin/generate_secret.php

test:
	prove -v --exec 'php' ./tests/*.t

js:
	java -Xmx64m -jar lib/google-compiler/compiler-20100616.jar --js www/javascript/youarehere.js --js www/javascript/youarehere.assertion.js --js www/javascript/youarehere.map.js --js www/javascript/youarehere.woe.js --js www/javascript/youarehere.getlatlon.js > www/javascript/youarehere.min.js	

setup:
	ubuntu/setup-ubuntu.sh
	ubuntu/setup-flamework.sh
	ubuntu/setup-secrets.sh
	ubuntu/setup-certified.sh
	sudo ubuntu/setup-certified-ca.sh
	sudo ubuntu/setup-certified-certs.sh
	ubuntu/setup-db.sh youarehere youarehere
	ubuntu/setup-apache.sh

styleguide:
	if test -e www/css/mapzen.styleguide.css; then cp www/css/mapzen.styleguide.css www/css/mapzen.styleguide.css.bak; fi
	curl -s -o www/css/mapzen.styleguide.css https://mapzen.com/common/styleguide/styles/styleguide.css
	curl -s -o www/javascript/mapzen.styleguide.min.js https://mapzen.com/common/styleguide/scripts/mapzen-styleguide.min.js 
