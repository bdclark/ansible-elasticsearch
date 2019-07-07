# Elasticsearch Ansible Role

Installs and configures Elasticsearch 5.x, 6.x, or 7.x.

Requirements
------------
This role is tested on Ansible 2.6, 2.7, and 2.8 using the following distributions:

- Ubuntu 18.04
- Ubuntu 16.04
- Centos 7
- Amazon Linux 2

Other operating systems and versions may work, YMMV.

Role Variables
--------------
See [defaults/main.yml](defaults/main.yml) for a list and description of
variables used in this role.

Example Playbook
----------------
```yaml
- hosts: servers
  vars:
    es_version: "6.2.2"
    es_config:
      bootstrap.memory_lock: true
  roles:
     - role: elasticsearch
```
