# PinoBox

A simple debian based vagrant environment.

# How to use

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