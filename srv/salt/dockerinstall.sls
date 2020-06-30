install dependancies for docker:
  pkg.installed:
    - pkgs:
       - apt-transport-https
       - ca-certificates
       - curl
       - software-properties-common
       - gnupg-agent
       - python-pip 
       - python-docker
       - python3-pip
       - python3-docker
       - containerd.io
  cmd.run:
    - names:
        - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        - sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
        - sudo apt-get update
install docker:
  pkg.installed:
    - pkgs:
       - docker-ce
       - docker-ce-cli
  #pip.installed:
  #  - name: docker
  #  - bin_env: '/usr/bin/pip3'
  #service.running:
  #  - name: docker
# 
  docker_container.running:
    - image: nginxdemos/hello
    - name: hello
    - network_mode: host
