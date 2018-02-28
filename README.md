# elasticsearch

Installs and configures Elasticsearch 5.x or 6.x.

Requirements
------------
Ansible 2.2+

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
    es_cluster_name: mycluster
    es_config:
      bootstrap.memory_lock: true
  roles:
     - role: elasticsearch
```
