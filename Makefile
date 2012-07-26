ACCOUNT=deployer@cirope.com
APP_DIR=/var/rack/cirope-site
REPO=https://github.com/cirope/cirope-site.git

.PHONY : prepare-deploy deploy 

prepare-deploy:
	ssh $(ACCOUNT) "mkdir -p $(APP_DIR) && cd $(APP_DIR) && git clone $(REPO) current"

deploy:
	ssh $(ACCOUNT) "cd $(APP_DIR)/current && git pull origin master && touch tmp/restart.txt"
