discourse-slovenian-i18n
======================

Slovenian  locale files for discourse

Idea based on https://github.com/lidel/discourse-locale-override 

This repo is used to load Slovenian localization files while bootstrapping or rebuilding a discourse docker instance.

You need to modify your app.yml file to get it working. Find the section where after code hooks are listed:

```ruby
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/discourse/docker_manager.git
```

and add the required lines, so the final version will be:

```ruby
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/discourse/docker_manager.git
    - exec:
        cd: /tmp
        cmd:
          - git clone https://github.com/smnplk/discourse-slovenian-i18n
          - cp -rT discourse-slovenian-i18n/ /var/www/discourse/
          - rm -rf discourse-slovenian-i18n
```

Then go inside your container and let rails regenerate assets. This is done via bash script that we copied above.

cd /var/discourse
./launcher ssh app
./reload_i18.sh
exit
./launcher restart app
