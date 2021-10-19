#! /bin/sh
echo "This is Sunny's VPS. Now cooking..."
apt update # very important 
apt install sudo
apt install curl
curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
apt install nodejs
wget https://github.com/thelounge/thelounge/releases/download/v4.2.0/thelounge_4.2.0_all.deb
apt install ./thelounge_4.2.0_all.deb
apt install nginx
mv /root/virtual-pony/glowup.izzymoonbow.eu.org /etc/nginx/sites-available/glowup.izzymoonbow.eu.org
ln -s /etc/nginx/sites-available/glowup.izzymoonbow.eu.org /etc/nginx/sites-enabled/glowup.izzymoonbow.eu.org
nginx -t
systemctl restart nginx
sudo -u thelounge thelounge add tiffany
sudo -u thelounge thelounge install thelounge-theme-mininapse
apt install certbot python3-certbot-nginx
certbot --nginx -d glowup.izzymoonbow.eu.org
sudo DEBIAN_PRIORITY=low apt install postfix
sudo postconf -e 'home_mailbox= Maildir/'
sudo postconf -e 'virtual_alias_maps= hash:/etc/postfix/virtual'
sudo nano /etc/postfix/virtual
sudo postmap /etc/postfix/virtual
sudo systemctl restart postfix
echo 'export MAIL=~/Maildir' | sudo tee -a /etc/bash.bashrc | sudo tee -a /etc/profile.d/mail.sh
# Command below may fail. Structure is created after sending first email anyway.
source /etc/profile.d/mail.sh
sudo apt install s-nail
sudo nano /etc/s-nail.rc
echo 'init' | s-nail -s 'init' -Snorecord root
nano ~/content
cat ~/content | s-nail -s 'Hi new friend' -r moon@pinkiehoney.eu.org rarihoney@gmail.com
ls -R ~/Maildir
echo "It's cooked!"
