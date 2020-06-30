install LAMP stack:
  pkg.installed:
    - pkgs:
      - apache2
      - mysql-server-5.7
      - php
      - libapache2-mod-php
 
Connect to mysql:
  cmd.run:
    - name: 'mysql -u root -p'
 
Restart database service:
  cmd.run:
    - name: 'sudo systemctl restart mysql'
       
install snmpd and snmp:
  pkg.installed:
    - pkgs:
      - rrdtool
      - cacti
      - cacti-spine
 
Restart snmpd:
  cmd.run:
    - name: 'sudo systemctl restart snmpd'
 
Restart apache:
  cmd.run:
    - name: 'sudo systemctl restart apache2'
 
Restart mysql:
  cmd.run:
    - name: 'sudo systemctl restart mysql'

Change cacti login password:
  cmd.run:
    - names:
      - sudo su
      - sudo mysql -u root -p cacti -e "update user_auth set password=md5('{{ pillar['cactipasswd'] }}') where username='admin'"

Run myscript:
  cmd.run:
    - name: /srv/salt/cacti.sh
    - cwd: /
    - stateful: True
