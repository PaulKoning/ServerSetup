deploy the log server:
  file.managed:
     - name: /etc/rsyslog.conf
     - source: salt://syslogserver/rsyslog.conf
  cmd.run:
    - name: sudo systemctl restart rsyslog
