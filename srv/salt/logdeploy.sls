deploy the rsyslog.conf:
  file.managed:
     - name: /etc/rsyslog.conf
     - source: salt://rsyslog/rsyslog.conf

deploy the 50-Logclient.conf:
  file.managed:
     - name: /etc/rsyslog.d/50-default.conf
     - source: salt://rsyslog/50-default.conf
   
  cmd.run: 
     - name: sudo systemctl restart rsyslog
