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

<Directory /acme-apache2-path>
	Options Indexes FollowSymLinks
  Require all granted
</Directory>

Alias /.well-known/acme-challenge /acme-apache2-path/.well-known/acme-challenge
```
This block specifies the configuration for the `/to/path/acme-apache2` directory. The Options directive enables directory indexing and following symbolic links. The Require all granted directive allows all users to access the directory.

