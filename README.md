##  Table Contents 

* [Install](https://github.com/koliboy/acme-apache2/edit/main/README.md)


### Install
```sh
source:~# wget https://github.com/koliboy/acme-apache2/archive/refs/heads/main.zip
unzip
```
### httpd/apache2 --confi
It seems like you're trying to configure the Apache web server using the httpd.conf file. The provided snippet appears to define a directory and an alias.

Here's a breakdown of the configuration:
`/to/path/httpd.conf`
```html

<Directory /acme-apache2>
	Options Indexes FollowSymLinks
  Require all granted
</Directory>

Alias /.well-known/acme-challenge /acme-apache2/.well-known/acme-challenge
```

