deploy the snmpd service: 
    pkg.installed:
       - names: 
         - snmp
         - snmpd
    service.running:
       - name: snmpd
    file.managed: 
       - name: /etc/snmp/snmpd.conf
       - source: salt://cacti/snmpd.conf
    cmd.run:
       - name: sudo systemctl restart snmpd
