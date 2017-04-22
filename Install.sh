#!/bin/sh

echo ""
echo ""
echo "Welcome to CR Release 3.0 installer" 
read -p "Enter server IP : " my_ip
echo ""
echo ""
echo "OK.....let us configure this for your CR server IP : $my_ip"
echo ""
echo ""
echo "      Access point information ( URLs you may want to note down ) "
echo ""
echo ""
echo "             eTRM                  --->      http://$my_ip:8351/etrm3"
echo "             Raxak Protect Portal  --->      http://$my_ip "
echo " "
echo " "
while true; do
    read -p "Do you wish to install this product?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

#mkdir /u01
apt-get -y install git
#git clone https://github.com/CloudRaxak/appliance3.0.git
# Lets install all stuff we need ....

apt-get update
apt-get -y upgrade

apt-get -y install unzip
apt-get -y install wget
apt-get -y install alien 
apt-get -y install cpanminus 
apt-get -y install libaio-dev 
apt-get -y install build-essential 
apt-get -y install libaio* 
apt-get -y install bc 
apt-get -y install unixodbc  
apt-get -y install alien 

cd /u01/appliance3.0 ; 

mkdir Install-Pack; cd Install-Pack
wget http://54.153.45.118/static/Appliance/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
wget http://54.153.45.118/static/Appliance/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
wget http://54.153.45.118/static/Appliance/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm

mkdir Disk1; cd Disk1
wget http://54.153.45.118/static/Appliance/oracle-xe_11.2.0-2_amd64.deb

mkdir response ; cd response
wget http://54.153.45.118/static/Appliance/xe.rsp

cd .. ; mkdir upgrade ; cd upgrade
wget http://54.153.45.118/static/Appliance/gen_inst.sql

cd /u01

cat <<EOI1 >> ~/.bashrc
export PERL_CPANM_OPT="-l $HOME/.perl"
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export LD_LIBRARY_PATH=/u01/app/oracle/product/11.2.0/xe/lib:$LD_LIBRARY_PATH
export PATH=/u01/app/oracle/product/11.2.0/xe/bin:$PATH
EOI1

cat <<EOI2 >> /etc/sudoers
%sudo  ALL=(ALL)       NOPASSWD: ALL
EOI2

groupadd -g 2000 dba
mkdir /home/oracle ; chmod 755 /home/oracle
useradd -d/home/oracle -g2000 oracle
chown oracle:dba /home/oracle

groupadd -g 3000 raxak
mkdir /home/raxak; chmod 755 /home/raxak
useradd -d/home/raxak -g3000 raxak
chown raxak:raxak /home/raxak
adduser raxak sudo

cp /u01/appliance3.0/conf_files/raxak_bash_profile /home/raxak/.bash_profile
chown raxak:raxak /home/raxak/.bash_profile ; chmod 644 /home/raxak/.bash_profile
cp /u01/appliance3.0/conf_files/chkconfig /sbin/chkconfig; chmod 755 /sbin/chkconfig  
cp /u01/appliance3.0/conf_files/60-oracle.conf /etc/sysctl.d/60-oracle.conf ; chmod 755 /etc/sysctl.d/60-oracle.conf 
cp /u01/appliance3.0/conf_files/S01shm_load /etc/rc2.d/S01shm_load ; chmod 755 /etc/rc2.d/S01shm_load 
ln -s /usr/bin/awk /bin/awk 
mkdir /var/lock/subsys ; touch /var/lock/subsys/listener
service procps start

dd if=/dev/zero of=/swapfile bs=1G count=2
chmod 600 /swapfile; mkswap /swapfile; swapon /swapfile

cat <<EOI3 >> /etc/fstab
/swapfile   none    swap    sw    0   0
EOI3

cd /u01/appliance3.0/Install-Pack/Disk1
sudo dpkg --install oracle-xe_11.2.0-2_amd64.deb

chmod 755 /etc/init.d/oracle-xe

. ~/.bashrc

rm -rf /dev/shm; mkdir /dev/shm
mount -t tmpfs shmfs -o size=2048m /dev/shm

/etc/init.d/oracle-xe configure << _EOI4_
8351
1522
manager
manager
Y
_EOI4_

service oracle-xe start

. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh

cd /u01/appliance3.0/Install-Pack
alien -i  oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
alien -i  oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
alien -i  oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm

cpanm RPC::EPC::Service DBI DBD::Oracle

cd /u01/appliance3.0/CR-DDL
sqlplus sys/manager as sysdba @CR_0_user.sql << _EOI5_
exit
_EOI5_

cd /u01/appliance3.0/eTRM
unzip files.zip; unzip images.zip

cat <<EOI6 >> etrm_install.sql
@etrm_image_upload.sql /u01/appliance3.0/eTRM
EOI6

sqlplus sys/manager as sysdba  << _EOI7_
@etrm_install.sql
exec dbms_xdb.setListenerLocalAccess (l_access => FALSE);
exit
_EOI7_

cd /u01/appliance3.0/CR-DDL
sed -i -- "s/104.199.124.60/$my_ip/g" CR_4_Scheduler.sql 

sqlplus raxak3/raxak3  << _EOI8A_
@CR_1_DDL.sql
@CR_2_Seed-Data.sql
@CR_3_Functions.sql
@CR_4_Scheduler.sql 
exit
_EOI8A_
sqlplus raxak3/raxak3   << _EOI8B_
@CR_1_DDL.sql
@CR_2_Seed-Data.sql
@CR_3_Functions.sql
@CR_4_Scheduler.sql 
exit
_EOI8B_

cd /u01/appliance3.0/CR-Profiles
sed -i -- "s/104.199.124.60/$my_ip/g" import_profile.pl
chmod 755 import_profile.pl
sh init.sh

sqlplus raxak3/raxak3   << _EOI8C_
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = 28) where id = 28;
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = 29) where id = 29;
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = 30) where id = 30;
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = 37) where id = 37;
update cpe_profile set is_active='Y' where resource_type_id < 38;
commit;
exit
_EOI8C_

sh CR.sh
cd /u01/appliance3.0/CR-DDL
/u01/appliance3.0/CR-Profiles/import_profile.pl CR10_raw_mof.sql 

apt-get -y install nginx
service nginx start

apt-get -y install python-pip 

pip install --upgrade pip
pip install gunicorn
apt-get -y install supervisor
apt-get -y install python-dev

mkdir /u01/rp; chown raxak:raxak /u01/rp

pip install virtualenv
pip install virtualenvwrapper

cd /u01/rp
git clone https://github.com/cloudraxak/raxak.git 
chown -R raxak:raxak raxak

su raxak -c "/bin/bash /u01/appliance3.0/Install_run_as_raxak.sh"

cd /u01/rp/raxak/raxakprotect/settings
sed -i -- "s/104.199.124.60/$my_ip/g" prod.py; sed -i -- "s/dmlatest/raxak3/g" prod.py
sed -i -- "s/104.199.124.60/$my_ip/g" dev.py; sed -i -- "s/dmlatest/raxak3/g" dev.py

cd /u01/rp/raxak
chown raxak:raxak raxakprotect.sh
chmod 755 raxakprotect.sh

echo_supervisord_conf > /etc/supervisord.conf

cat <<EOI10 >> /etc/supervisor/supervisord.conf

[program:raxakprotect]
directory = /u01/rp/raxak
user = raxak
command = /u01/rp/raxak/raxakprotect.sh gunicorn raxakprotect.wsgi:application -k gevent --worker-connections 1000 --timeout 500 --bind localhost:8001 --enable-stdio-inheritance --log-level "verbose" --reload --error-logfile "-"

stdout_logfile = /var/log/supervisord/access.log
stderr_logfile = /var/log/supervisord/error.log

EOI10

cat <<EOI11 > /etc/init.d/supervisord
# Supervisord auto-start
# supervisord Bring up/down supervisord
#
# description: Auto-starts supervisord
# processname: supervisord
# pidfile: /var/run/supervisord.pid

SUPERVISORD=/etc/init.d/supervisord
SUPERVISORD_ARGS='-c /etc/supervisord.conf'
SUPERVISORCTL=/usr/local/bin/supervisorctl

case \$1 in
start)
    echo -n "Starting supervisord: "
    \$SUPERVISORD \$SUPERVISORD_ARGS
    echo
    ;;
stop)
    echo -n "Stopping supervisord: "
    \$SUPERVISORCTL shutdown
    echo
    ;;
restart)
    echo -n "Stopping supervisord: "
    \$SUPERVISORCTL shutdown
    echo
    echo -n "Starting supervisord: "
    \$SUPERVISORD \$SUPERVISORD_ARGS
    echo
    ;;
esac

EOI11


chmod +x /etc/init.d/supervisord
mkdir /var/log/supervisord; mkdir -p /var/www/raxakprotect/static
chown -R raxak:raxak /var/www

cat <<EOI12 > /etc/nginx/nginx.conf
user raxak;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

# Load dynamic modules. See /usr/share/nginx/README.dynamic.
include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}
http {
    log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                      '\$status \$body_bytes_sent "\$http_referer" '
                      '"\$http_user_agent" "\$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;
    proxy_connect_timeout   180;
    proxy_send_timeout      180;
    proxy_read_timeout      180;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    # Load modular configuration files from the /etc/nginx/conf.d directory.
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    # for more information.
    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;

}

EOI12


cat <<EOI13 > /etc/nginx/sites-enabled/raxakprotect
server {
    # the port your site will be served on
    listen      80;
    # the domain name it will serve for
    server_name $my_ip 127.0.0.1 localhost;   # substitute by your FQDN and machine's IP address
                                       # You can write the ip address also. server_name <your_ip>
    charset     utf-8;

    #Max upload size
    client_max_body_size 75M;   # adjust to taste

    # Django media
    location /static  {
         alias /var/www/raxakprotect/static;
    }

    # Finally, send all non-media requests to the Django server.
    location / {
        proxy_read_timeout 300;
        proxy_http_version 1.1;
        proxy_set_header Connection "";
        proxy_pass http://127.0.0.1:8001;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        add_header P3P 'CP="ALL DSP COR PSAa PSDa OUR NOR ONL UNI COM NAV"';
    }
}

EOI13

cd /u01/rp/raxak
python manage.py collectstatic << _EOI23_
yes
_EOI23_

apt-get -y install libevent-dev 
apt-get -y install python-all-dev 
easy_install greenlet
easy_install gevent 

chown -R raxak:raxak /var/log/nginx

service nginx restart
#service supervisord restart
supervisord -c /etc/supervisor/supervisord.conf  
sudo supervisorctl reload

cd /u01/rp/raxak
python manage.py migrate
python manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('raxak@cloudraxak.com', 'raxak@cloudraxak.com', 'CloudRaxak')"

cd /u01
sqlplus raxak3/raxak3   << _EOI99_
update cpe_user set auth_user_id = 1 where parent_id is null;
commit;
exit
_EOI99_

rm -rf appliance3.0


echo;echo;echo
echo "all done.....go to portal and for a change, at least do some work.....you lazy bum...."
echo ; echo "*****" ; echo;echo;
echo


