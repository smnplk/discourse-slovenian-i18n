#!/bin/bash
# A simple script to reload translations from github

cd /tmp
git clone https://github.com/smnplk/discourse-slovenian-i18n
cp -rT discourse-slovenian-i18n/ /var/www/discourse/
cp -f discourse-slovenian-i18n/reload_i18n.sh /root/reload_i18n.sh
chmod +x /root/reload_i18n.sh
rm -rf discourse-slovenian-i18n
cd /var/www/discourse
sudo -u discourse RAILS_ENV=production bundle exec rake assets:clobber assets:precompile
