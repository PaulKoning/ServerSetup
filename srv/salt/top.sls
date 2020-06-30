base:
  'logclient.internal.cloudapp.net':
    - dockerinstall
    - logdeploy
  'logclient2.internal.cloudapp.net':
    - wpinstall
    - logdeploy
  'itv2f-ubu-36.internal.cloudapp.net': 
    - logserverdeploy
  'itv2f-ubu-35.internal.cloudapp.net':
    - cactiinstall
    - logdeploy
  '*':
    - snmpd

