#!/bin/bash
set -e
echo "Trying to initialise Drupal sites directory..."
# If sites/default/settings.php doesn't exist, initialize sites/
if [ ! -f /var/www/html/sites/default/settings.php ]; then
  echo "Initialising Drupal sites directory..."

  # Copy default sites from the image
  cp /opt/drupal/web/core/assets/scaffold/files/default.settings.php /var/www/html/sites/default/
  cp /opt/drupal/web/core/assets/scaffold/files/default.settings.php /var/www/html/sites/default/settings.php

  chown -R www-data:www-data /var/www/html/sites
  chmod -R 775 /var/www/html/sites
fi

exec apache2-foreground
