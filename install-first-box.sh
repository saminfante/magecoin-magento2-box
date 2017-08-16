#!/bin/bash

# /*=================================
# =            VARIABLES            =
# =================================*/
INSTALL_NGINX_INSTEAD=0
WELCOME_MESSAGE='
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmmddhhyysyyyyyyyhhddmNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmhysoooooooooooooooooooooooooosydmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMmhyoooooooo+//::---......---:://+ooooooooyhmMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMmdyoooooo+/:.``    ```........``     ``.:/+ooooooyhmMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMNhsooooo/:.`  `..-:/++ooooooooooooo+++/:-.`   `.:/oooooshNMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMNdyoooo+:.`  .-:++oooooooooooooooooooooooooooo+/:.`  `.:+oooosdMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMNhsooo+:.` `-/+ooooooooooooooooooooooooooooooooooooo++:.` `.:+oooshNMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMmysooo/-` `-/+oooooooooooooooooooooooooooooooooooooooooooo+:.  `-/ooosymMMMMMMMMMMMMMM
MMMMMMMMMMMMNhoooo/.  ./+oooooooooooooooooooooooooooooooooooooooooooooooooo+:`  ./ooooyNMMMMMMMMMMMM
MMMMMMMMMMMdsooo/.  -/ooooooooooooooooooooooooooooooooooooooooooooooooooooooo+/.  ./ooosdMMMMMMMMMMM
MMMMMMMMMNyooo+.  .+oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo/`  .+oooyNMMMMMMMMM
MMMMMMMMmsooo:` ./ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+:` `:ooosdMMMMMMMM
MMMMMMMdooo+.  :ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+.  .+ooodMMMMMMM
MMMMMMhooo/` `/oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo:  `/ooohMMMMMM
MMMMMhooo/  .+oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo/` `/ooohMMMMM
MMMMdooo/  .+oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo/`  /ooodMMMM
MMMmooo/  .ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo/   /ooomMMM
MMNsoo+` `+ooooooo::::::ooooooooooooooooo+:::::/ooooooooooooo++/:-.....-:/+oooooooooooooo/  `+oosNMM
MMhooo.  /oooooooo`     :oooooooooooooooo.     -oooooooooo+/.`     ```     .:+oooooooooooo-  -ooohMM
MNooo/  -ooooooooo`      /oooooooooooooo-      -oooooooo+-`   `-://+++//-`    -+oooooooooo+`  /oooNM
Mhooo.  +ooooooooo`      `+oooooooooooo:   `   -ooooooo/`   ./oooooooooooo+-  `:ooooooooooo:  .ooohM
Msoo+  .oooooooooo`   /   .ooooooooooo/   .:   -oooooo:   `:oooooooooooooooo++ooooooooooooo+   +oosM
mooo:  /oooooooooo`   o:   -ooooooooo+`  `+/   -ooooo+    /ooooooooooooooooooooooooooooooooo.  :ooom
mooo.  +oooooooooo`   oo-   :oooooooo.   /o/   -ooooo-   :oooooooooooooooooooooooooooooooooo:  .ooom
dooo` `ooooooooooo`   ooo.   /oooooo.   :oo/   -ooooo`   +oooooooooooooooooooooooooooooooooo/  `oooh
hooo` `ooooooooooo`   ooo+`  `+oooo:   -ooo/   -ooooo`   +oooooooooooooooooooooooooooooooooo/  `oooh
dooo` `ooooooooooo`   oooo/   `ooo/   .oooo/   -ooooo.   /oooooooooooooooooooooooooooooooooo/  `oooh
mooo.  +oooooooooo`   ooooo:   -o+`  `+oooo/   -ooooo:   `oooooooooooooooooooooooooooooooooo:  .ooom
mooo-  /oooooooooo`   oooooo-   -`   +ooooo/   -oooooo.   .+oooooooooooooooooooooooooooooooo-  -oooN
Msoo/  -oooooooooo`   ooooooo.      /oooooo/   -ooooooo.   `:oooooooooooooo+..:+oooooooooooo`  /oosM
Mhooo` `oooooooooo`   ooooooo+`    -ooooooo/   -oooooooo:`   `-/+ooooooo+:.   `/ooooooooooo/  `ooohM
MNooo:  :ooooooooo`   oooooooo+   .oooooooo/   -ooooooooo+:.    ``.....`    `:+oooooooooooo`  :oooNM
MMhoo+` `+oooooooo.``.ooooooooo/`.+oooooooo/```:oooooooooooo+:-.``     ``.:/+ooooooooooooo:  `+ooyMM
MMNsoo/  .oooooooooooooooooooooooooooooooooooooooooooooooooooooo+++++++++oooooooooooooooo+`  /oosNMM
MMMmooo-  -ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+`  -ooomMMM
MMMMhooo.  :ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+.  .ooodMMMM
MMMMMhoo+.  -ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+.  .+oohMMMMM
MMMMMMhoo+-  .+oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo/`  -ooohMMMMMM
MMMMMMMhooo:  `/oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo:   :ooohMMMMMMM
MMMMMMMMmsoo/`  -+oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo/.  `/oosdMMMMMMMM
MMMMMMMMMNyoo+-  `:ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+-   -+ooyNMMMMMMMMM
MMMMMMMMMMMdsoo/.  .:+oooooooooooooooooooooooooooooooooooooooooooooooooooooooo+-`  ./oosdMMMMMMMMMMM
MMMMMMMMMMMMNhooo/.  `:+oooooooooooooooooooooooooooooooooooooooooooooooooooo/-`  ./oooyNMMMMMMMMMMMM
MMMMMMMMMMMMMMNyooo/.` `./+oooooooooooooooooooooooooooooooooooooooooooooo+:.  `./oooyNMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMNhsoo+:`  `-/+ooooooooooooooooooooooooooooooooooooooo++:.   `:+ooshmMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMNdsooo/-`   .-/+ooooooooooooooooooooooooooooooo++:-`   `-/ooosdNMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMmhsooo+:.`   `.-:/+ooooooooooooooooooo++/:-.`   `.:+oooshmMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMmdyoooo+:-.`    ``..---:::::----..`     `.-:+ooooydNMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMmdyooooo+/:-..``            ``..-:/+oooooydmMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNmhysooooooooo++++++++ooooooooosyhmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNNmdhhhyyyyyyyyyyhhhdmmNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    __  ___                 ______      _     
   /  |/  /___ _____ ____  / ____/___  (_)___ 
  / /|_/ / __ `/ __ `/ _ \/ /   / __ \/ / __ \
 / /  / / /_/ / /_/ /  __/ /___/ /_/ / / / / /
/_/  /_/\__,_/\__, /\___/\____/\____/_/_/ /_/ 
             /____/                           

For help, please visit magecoin.com.
'

reboot_webserver_helper() {

    if [ $INSTALL_NGINX_INSTEAD != 1 ]; then
        sudo service apache2 restart
    fi

    if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
        sudo systemctl restart php7.0-fpm
        sudo systemctl restart nginx
    fi

    echo 'Rebooting your webserver'
}





# /*=========================================
# =            CORE / BASE STUFF            =
# =========================================*/
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y build-essential
sudo apt-get install -y tcl
sudo apt-get install -y software-properties-common
sudo apt-get -y install vim
sudo apt-get -y install git



# /*======================================
# =     BASE STUFF FOR MAGENTO 2         =
# ======================================*/
# /*======================================
# =           (version 2.1.8)            =
# ======================================*/
# -OPERATING SYSTEM (LINUX x86-64)
# -2GB RAM






# /*======================================
# =            INSTALL APACHE            =
# ======================================*/
# /*======================================
# =           (version 2.4.x)            =
# ======================================*/
if [ $INSTALL_NGINX_INSTEAD != 1 ]; then

    # Install the package
    sudo apt-get -y install apache2

    # Remove "html" and add public
    mv /var/www/html /var/www/public

    # Clean VHOST with full permissions
    MY_WEB_CONFIG='<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/public
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
        <Directory "/var/www/public">
            Options Indexes FollowSymLinks
            AllowOverride all
            Require all granted
        </Directory>
    </VirtualHost>'
    echo "$MY_WEB_CONFIG" | sudo tee /etc/apache2/sites-available/000-default.conf

    # Squash annoying FQDN warning
    echo "ServerName scotchbox" | sudo tee /etc/apache2/conf-available/servername.conf
    sudo a2enconf servername

    # Enabled missing h5bp modules (https://github.com/h5bp/server-configs-apache)
    sudo a2enmod expires
    sudo a2enmod headers
    sudo a2enmod include
    sudo a2enmod rewrite

    sudo service apache2 restart

fi



# /*=====================================
# =            INSTALL NGINX            =
# =====================================*/
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then

    # Install Nginx
    sudo apt-get -y install nginx
    sudo systemctl enable nginx

    # Remove "html" and add public
    mv /var/www/html /var/www/public

    # Make sure your web server knows you did this...
    MY_WEB_CONFIG='server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/public;
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
            try_files $uri $uri/ =404;
        }
    }'
    echo "$MY_WEB_CONFIG" | sudo tee /etc/nginx/sites-available/default

    sudo systemctl restart nginx

fi








# /*===================================
# =            INSTALL PHP            =
# ===================================*/
# /*===================================
# =      (version 7.0.6-7.0.x)        =
# ===================================*/
sudo apt-get -y install php

# Make PHP and Apache friends
if [ $INSTALL_NGINX_INSTEAD != 1 ]; then

    sudo apt-get -y install libapache2-mod-php

    # Add index.php to readable file types
    MAKE_PHP_PRIORITY='<IfModule mod_dir.c>
        DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
    </IfModule>'
    echo "$MAKE_PHP_PRIORITY" | sudo tee /etc/apache2/mods-enabled/dir.conf

    sudo service apache2 restart

fi

# Make PHP and NGINX friends
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then

    # FPM STUFF
    sudo apt-get -y install php-fpm
    sudo systemctl enable php7.0-fpm
    sudo systemctl start php7.0-fpm

    # Fix path FPM setting
    echo 'cgi.fix_pathinfo = 0' | sudo tee -a /etc/php/7.0/fpm/conf.d/user.ini
    sudo systemctl restart php7.0-fpm

    # Add index.php to readable file types and enable PHP FPM since PHP alone won't work
    MY_WEB_CONFIG='server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/public;
        index index.php index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
            try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/run/php/php7.0-fpm.sock;
        }

        location ~ /\.ht {
            deny all;
        }
    }'
    echo "$MY_WEB_CONFIG" | sudo tee /etc/nginx/sites-available/default

    sudo systemctl restart nginx

fi







# /*===================================
# =            PHP MODULES            =
# ===================================*/
#   (Double-check these PHP extensions)
# - bc-math
# - curl
# - gd, ImageMagick 6.3.7+ or both
# - intl
# - mbstring
# - mcrypt
# - mhash
# - openssl
# - PDO/MySQL
# - SimpleXML
# - soap
# - xml
# - xsl
# - zip
# - json
# - iconv

# Base Stuff
sudo apt-get -y install php-common
sudo apt-get -y install php-all-dev

# Common Useful Stuff
sudo apt-get -y install php-bcmath
sudo apt-get -y install php-bz2
sudo apt-get -y install php-cgi
sudo apt-get -y install php-cli
sudo apt-get -y install php-fpm
sudo apt-get -y install php-imap
sudo apt-get -y install php-intl
sudo apt-get -y install php-json
sudo apt-get -y install php-mbstring
sudo apt-get -y install php-mcrypt
sudo apt-get -y install php-odbc
sudo apt-get -y install php-pear
sudo apt-get -y install php-pspell
sudo apt-get -y install php-tidy
sudo apt-get -y install php-xmlrpc
sudo apt-get -y install php-zip

# Enchant
sudo apt-get -y install libenchant-dev
sudo apt-get -y install php-enchant

# LDAP
sudo apt-get -y install ldap-utils
sudo apt-get -y install php-ldap

# CURL
sudo apt-get -y install curl
sudo apt-get -y install php-curl

# GD
sudo apt-get -y install libgd2-xpm-dev
sudo apt-get -y install php-gd

# IMAGE MAGIC
sudo apt-get -y install imagemagick
sudo apt-get -y install php-imagick






# /*===========================================
# =            CUSTOM PHP SETTINGS            =
# ===========================================*/
#   (Double-check these PHP extensions/settings)
# - PHP configuration file, php.ini
# - PHP options
# - timezone/date
# - always_populate_raw_post_data = -1
# - disable asp_tags
# - enable opcache.save_comments
# - enable OPcache
# - PHP OPcache options
# - PHP code comments in getDocComment validation call...
# - ...in the getExtensionAttributes method in...
# - ...Magento\Framework\Api\ExtensionAttributesFactory.php
# - SSL
# - SMTP Server

if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
    PHP_USER_INI_PATH=/etc/php/7.0/fpm/conf.d/user.ini
else
    PHP_USER_INI_PATH=/etc/php/7.0/apache2/conf.d/user.ini
fi

echo 'display_startup_errors = On' | sudo tee -a $PHP_USER_INI_PATH
echo 'display_errors = On' | sudo tee -a $PHP_USER_INI_PATH
echo 'error_reporting = E_ALL' | sudo tee -a $PHP_USER_INI_PATH
echo 'short_open_tag = On' | sudo tee -a $PHP_USER_INI_PATH
reboot_webserver_helper

# Disable PHP Zend OPcache
echo 'opache.enable = 0' | sudo tee -a $PHP_USER_INI_PATH

# Absolutely Force Zend OPcache off...
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
    sudo sed -i s,\;opcache.enable=0,opcache.enable=0,g /etc/php/7.0/fpm/php.ini
else
    sudo sed -i s,\;opcache.enable=0,opcache.enable=0,g /etc/php/7.0/apache2/php.ini
fi
reboot_webserver_helper



# /*================================
# =            PHP UNIT            =
# ================================*/
sudo wget https://phar.phpunit.de/phpunit-6.1.phar
sudo chmod +x phpunit-6.1.phar
sudo mv phpunit-6.1.phar /usr/local/bin/phpunit
reboot_webserver_helper



# /*=============================
# =            MYSQL            =
# =============================*/
# /*=============================
# =       (version 5.7.x)       =
# =============================*/
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server
sudo mysqladmin -uroot -proot create scotchbox
sudo apt-get -y install php-mysql
reboot_webserver_helper



# /*==============================
# =            SQLITE            =
# ===============================*/
sudo apt-get -y install sqlite
sudo apt-get -y install php-sqlite3
reboot_webserver_helper



# /*================================
# =            COMPOSER            =
# ================================*/
# /*================================
# =     (latest stable version)    =
# ================================*/
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")
php composer-setup.php --quiet
rm composer-setup.php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod 755 /usr/local/bin/composer



# /*============================
# =            RUBY            =
# ============================*/
sudo apt-get -y install ruby
sudo apt-get -y install ruby-dev

# Use RVM though to make life easy
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.4.1
rvm use 2.4.1


# /*=============================
# =            REDIS            =
# =============================*/
# /*=============================
# =       (version 3.0+)        =
# =============================*/
sudo apt-get -y install redis-server
sudo apt-get -y install php-redis
reboot_webserver_helper


# /*=================================
# =            MEMCACHED            =
# =================================*/
# - latest stable version
# - also memcache or memcached PHP ext.
sudo apt-get -y install memcached
sudo apt-get -y install php-memcached
reboot_webserver_helper


# /*=================================
# =            VARNISH              =
# =================================*/
# - version 3.5 or latest stable 4.x


# /*=================================
# =            OPTIONAL             =
# =================================*/
# - php_xdebug2.2.0+
# - PHPUnit (as CLI tool) ver. 4.1+



# /*===============================
# =            MAILHOG            =
# ===============================*/
sudo wget --quiet -O ~/mailhog https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64
sudo chmod +x ~/mailhog

# Enable and Turn on
sudo tee /etc/systemd/system/mailhog.service <<EOL
[Unit]
Description=MailHog Service
After=network.service vagrant.mount
[Service]
Type=simple
ExecStart=/usr/bin/env /home/vagrant/mailhog > /dev/null 2>&1 &
[Install]
WantedBy=multi-user.target
EOL
sudo systemctl enable mailhog
sudo systemctl start mailhog

# Install Sendmail replacement for MailHog
sudo go get github.com/mailhog/mhsendmail
sudo ln ~/go/bin/mhsendmail /usr/bin/mhsendmail
sudo ln ~/go/bin/mhsendmail /usr/bin/sendmail
sudo ln ~/go/bin/mhsendmail /usr/bin/mail

# Make it work with PHP
if [ $INSTALL_NGINX_INSTEAD == 1 ]; then
    echo 'sendmail_path = /usr/bin/mhsendmail' | sudo tee -a /etc/php/7.0/fpm/conf.d/user.ini
else
    echo 'sendmail_path = /usr/bin/mhsendmail' | sudo tee -a /etc/php/7.0/apache2/conf.d/user.ini
fi

reboot_webserver_helper


# /*=================================
# =  CONFIG BEFORE COMPOSER INSTALL =
# =================================*/
# - Create Magento file system owner
# - Install Composer

# /*=================================
# =  CONFIG AFTER COMPOSER INSTALL =
# =================================*/
# - Get Magento 2.1.8.x CE metapackage
# - Set pre-install permissions
# - Set modes
# - Command line install
# - Install Magento (secure)
# - Configure cron







# /*=======================================
# =            WELCOME MESSAGE            =
# =======================================*/

# Disable default messages by removing execute privilege
sudo chmod -x /etc/update-motd.d/*

# Set the new message
echo "$WELCOME_MESSAGE" | sudo tee /etc/motd











# /*====================================
# =            YOU ARE DONE            =
# ====================================*/
echo 'Boom! Your MageCoin devbox install is complete, bro!'