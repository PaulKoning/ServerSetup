create database: 
  cmd.run:
    - name: 'mysql -u root -p'
deploy monitor:
  pkg.installed:
    - pkgs:
      - cacti
      - cacti-spine
      - rrdtool
restart apache2: 
  cmd.run:
    - name: sudo systemctl restart apache2 
restart mysql: 
  cmd.run:
    - name: sudo systemctl restart mysql
restart snmpd:
  cmd.run:
    - name: sudo systemctl restart snmpd
