deploy wp:
  pkg.installed:
    - pkgs:
      - apache2
      - wordpress
      - libapache2-mod-php
      - mysql-server
      - php-mysql
  service.running:
    - name: mysql
    - name: apache2
copy wp files to www:
  cmd.run:
    - name: cp -R /usr/share/wordpress /var/www/html
connect to sql:
  cmd.run:
    - name: mysql -u root -p
create wp database:
  cmd.run:
    - name: mysql -u root -p -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
create user for wpdb:
  cmd.run:
    - name: mysql -u root -p -e "GRANT ALL ON wordpress.* TO '{{ pillar['wpusr'] }}'@'localhost' IDENTIFIED BY '{{ pillar['wppasswd'] }}';"
remove old privs:
  cmd.run:
    - name: mysql -u root -p -e "FLUSH PRIVILEGES;"
restart apache2:
  cmd.run:
    - name: sudo systemctl restart apache2
change rights of wp files:
  cmd.run:
    - name: sudo chown -R www-data:www-data /var/www/
Files db config synchen:
  file.managed:
    - name: /var/www/html/wordpress/wp-config.php
    - source: salt://wordpress/wp-config.php
page config:
  file.managed:
    - name: /etc/apache2/sites-available/wordpress.conf
    - source: salt://wordpress/wordpress.conf
create file:
  cmd.run:
    - name: sudo touch /etc/wordpress/config-default.php 
restart apache2 once more:
  cmd.run:
    - name: sudo systemctl restart apache2
