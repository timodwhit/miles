#!/bin/bash
# Check if drush is installed. If not, it won't work.
rm -r README.md *.make mmg_custom_lite.info mmg_custom_lite.profile mmg_custom_lite.install patches
git checkout build-mmg_custom_lite.make drupal-org-core.make
mkdir htdocs
mv build-mmg_custom_lite.make htdocs/build-mmg_custom_lite.make
mv drupal-org-core.make htdocs/drupal-org-core.make
cd htdocs
drush make build-mmg_custom_lite.make -y
rm build-mmg_custom_lite.make drupal-org-core.make
cd ../
