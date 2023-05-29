##  Table Contents 

* [Install](#install)
* [httpd/apache2 config](#httpdapache2---confi)
* [sites](#sites)
* [acme-apache2-cmds](#acme-apache2-cmds)
* [gen-new-Certificate](#gen-new-cert)
     *  [gen-new-cert](#single-domain)
     *  [with-sub-domains](#with-sub-domains)
 * [remve-Certificate](#remove-cert)
 * [Certificates](#certdirdata)


### Install
```sh
source:~# wget https://github.com/koliboy/acme-apache2/archive/refs/heads/main.zip
source:~# unzip main.zip
source:~# chmod -R 755 acme-apache2-main
source:~# cd acme-apache2-main
source:~/acme-apache2-main# ./new  #any help is working
```

It seems that you have successfully downloaded the `main.zip` file, extracted its contents, and changed the permissions for the `acme-apache2-main` directory. Now, you are inside the `acme-apache2-main` directory and want assistance with running the `new` script.

To run the `new` script, you can try the following steps:

1. Make sure you are in the `acme-apache2-main` directory. If not, navigate to the directory using the `cd` command:

```
source:~# cd acme-apache2-main
```

2. List the files in the directory to verify the presence of the `new` script:

```
source:~/acme-apache2-main# ls
```

Check if the `new` script is listed.

3. Ensure that the `new` script has executable permissions. You have already set the permissions using `chmod -R 755 acme-apache2-main`, so it should already be executable. You can verify this by using the `ls -l` command and checking the permissions:

```
source:~/acme-apache2-main# ls -l new
```

Make sure the permissions are set to allow execution (e.g., `-rwxr-xr-x`).

4. Run the `new` script using the `./` prefix:

```
source:~/acme-apache2-main# ./new
```

This command will execute the `new` script within the current directory. If the script requires any additional arguments or inputs, please provide them accordingly.

Please note that without more information about the `new` script and its purpose, I can only provide general guidance. If you encounter any errors or need further assistance, please provide more details about the script and the specific issues you are facing.

### httpd/apache2 --confi
It seems like you're trying to configure the Apache web server using the httpd.conf file. The provided snippet appears to define a directory and an alias.

Here's a breakdown of the configuration:
`/to/path/httpd.conf`
```html

<Directory /acme-apache2-main>
	Options Indexes FollowSymLinks
  Require all granted
</Directory>

Alias /.well-known/acme-challenge acme-apache2-main/.well-known/acme-challenge
```
This block specifies the configuration for the `/to/path/acme-apache2` directory. The Options directive enables directory indexing and following symbolic links. The Require all granted directive allows all users to access the directory.

This line sets up an alias so that requests to `/.well-known/acme-challenge` are internally mapped to the ` /acme-apache2-path/.well-known/acme-challenge` directory.

Please note that to apply these configurations, you'll need to edit the httpd.conf file of your Apache installation and restart the Apache server for the changes to take effect. Also, make sure to use the appropriate path for the httpd.conf file on your system.
### sites
`conf/sites-enabled/test.com.conf`
```html
<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	ServerName test.com
	DocumentRoot  "to/path/test.com"
    
    </VirtualHost>
```

```
source:~# systemctl restart apache2
```
### acme-apache2-cmds 
```sh
source:~/acme-apache2-main# ./new
--subj    == countryName,state_name,localityName,orgname,organizationalUnitName
            Pattern:C,ST,L,O,OU
            --subj IN,Rajthan,city,oragtion,organizationalUnitName

--conf   ==   base/dir Where httpd Site Visiting Sites conf Is Available Cake
              (e.g.,) /sdk-srvar/apache2/usr/conf/sites,  or/sdk-srvar/apache2/usr/conf/sites-enabled
             find error fix this sites-enabled/mysite.com/mysite.com.conf

--subd   ==   subdomain,include the word menu with menu man same certificate subdomain , enter the name of all those you want to get certificate
              (e.g.,) --subd 1.test.com,2.test.com
```

```sh
source:~/acme-apache2-main# ./remove
--domain  == Enter the name in remove SSL/TLS (e.g.,webhost.com) you can also use the name of the subdomain (e.g.,anthor.domain.com)

--conf  == base/dir Where httpd Site Visiting Sites conf Is Available Cake
              (e.g.,) /sdk-srvar/apache2/usr/conf/sites,,WHERE confi domains files
```

### gen-new-cert

##### single-domain
```sh
source:~/acme-apache2-main# ./new --domain test.com --subj IN,Rajthan --conf /to/path/conf/sites-enabled
```

##### with-sub-domains
```sh
source:~/acme-apache2-main# ./new --domain test.com \
--subj IN,Rajthan \
--conf /to/path/conf/sites-enabled \
--subd 1.test.com,2.test.com
```
##### httpd restart 
```sh 
source:~# systemctl restart apache2
```
**vist == https://test.com**

### remove-cert
```sh 
./remove --domain test.com --conf /to/path/conf/sites-enabled
```
### cert/dir/data 
```sh 
source:~/acme-apache2-main# cd data/domains/test.com
source:~/acme-apache2-main/data/domains/test.com# ls 
server.csr,server.cert
```
