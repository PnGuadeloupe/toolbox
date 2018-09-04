### Ansible

#### Installer ansible

```bash
pip install ansible
```

#### Lancer ansible sur les serveurs

Pour lancer tous les playbooks:
```bash
ansible-playbook -i hosts playbook.yml
```

Pour lancer un tag sur un serveur particulier:
```bash
ansible-playbook -i hosts playbook.yml --tags docker
```