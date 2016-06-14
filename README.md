# PinoBox

A simple debian based vagrant environment.

## First use
1) download this repository

2) edit Vagrantfile:

```
config.vm.synced_folder "PATH_TO_WEBSITES_ON_HOST_MACHINE", "/home/pinobox/www", type: "nfs"
```

replace PATH_TO_WEBSITES_ON_HOST_MACHINE with the path (relative or absolute) to your website files.

I have:
```
config.vm.synced_folder "../development", "/home/pinobox/www", type: "nfs"
```

Note that this folder should be outside of the pinobox directory.

## Daily usage

``` vagrant up ```

### Adding a site

Edit settings.yaml to add your site:
```
    - map: hostname.tld
      to: path/to/hostname/files
```

Additionally you can add drupal or symfony support:

drupal:
```
    - map: hostname.tld
      to: path/to/hostname/files
      drupal: true
```

symfony:
```
    - map: hostname.tld
      to: path/to/hostname/files
      symfony: true
```

symfony:
```
    - map: hostname.tld
      to: path/to/hostname/files
      node: true
      port: 3000
```
This will proxy all requests to hostname.tld:80 to localhost:3000

### SSH connection
The box supports ssh access:

``` vagrant ssh ```

host: 192.168.10.10
user: pinobox
password: secret

!this user has NOPASSWD sudo rights


### MariaDB connection info
username: root
password: secret

### Acessing your sites
To access a site, you need to edit your host file and point the ```hostname.tld``` to the address ```192.168.10.10```
