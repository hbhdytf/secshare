#########################################################################
# File Name: test.sh
# Author: sandy
# mail: sandy@luo.bo
# Created Time: Thu 01 May 2014 04:31:47 PM CST
#########################################################################
#!/bin/bash

cd ~/secshare/secshare/
trash-put sec.txt.* s1.key s1
cd /home/sandy/Fuzzy/

./genSS 02_03.bmp
./recSS 02_03.bmp 02_03.bmp s1.key
sleep 10s
mv ~/Fuzzy/s1.key ~/secshare/secshare/s1.key

cd ~/secshare/secshare/
./secshare 2 sec.txt s1 s2 s3

trash-put s1.key
cd ~/Fuzzy/
./recSS 02_03.bmp 02_02.bmp s1.key
cd -
sleep 10s
mv /home/sandy/Fuzzy/s1.key ./s1.key
./secshare -2 sec.txt.enc s1 s2 

content=`cat ~/secshare/secshare/sec.txt.enc.dec`
if [ -z $content ]
then 
	echo "NULL";
else 
	echo "NOT NULL";
	echo $content
fi
