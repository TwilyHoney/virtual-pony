#! /bin/bash
rm /root/result.txt
bash /root/one.sh >> /root/result.txt
cat /root/result.txt | msmtp rarihoney@gmail.com
