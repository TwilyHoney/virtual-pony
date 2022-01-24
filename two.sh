#! /bin/bash
# On Server with control panel, use "/home/domain_without_tld_part/public_html". Otherwise, use "/var/www/your_domain".
rm /home/lauraorchid/public_html/result.txt
# Make sure to output to your web root.
bash /root/one.sh >> /home/lauraorchid/public_html/result.txt
# Afterwards, open https://your_domain/result.txt
