#########################################################################
# File Name: test.sh
# Author: sandy
# mail: sandy@luo.bo
# Created Time: Thu 01 May 2014 04:31:47 PM CST
#########################################################################
#!/bin/bash

cd ~/secshare/secshare/
trash-put sec.txt.* s1.key s1 s2.key s2 s3.key s3
cd /home/sandy/Fuzzy/

./genSS 02_03.bmp
./recSS 02_03.bmp 02_03.bmp s1.key
sleep 3s
./genSS S1001R01.bmp
./recSS S1001R01.bmp S1001R01.bmp s2.key
sleep 3s
./genfinSS f101_1.txt
./recfinSS f101_1.txt f101_1.txt s3.key
sleep 3s
mv ~/Fuzzy/s1.key ~/secshare/secshare/s1.key
mv ~/Fuzzy/s2.key ~/secshare/secshare/s2.key
mv ~/Fuzzy/s3.key ~/secshare/secshare/s3.key

cd ~/secshare/secshare/
./secshare 2 sec.txt s1 s2 s3

trash-put *.key
cd ~/Fuzzy/
./recSS 02_03.bmp 02_02.bmp s1.key
sleep 10s
./recSS S1001R01.bmp S1001R03.bmp s2.key
sleep 10s
./recfinSS f101_1.txt f101_1.txt s3.key
sleep 10s
cd -
mv /home/sandy/Fuzzy/s1.key ./s1.key
mv /home/sandy/Fuzzy/s2.key ./s2.key
mv /home/sandy/Fuzzy/s3.key ./s3.key
./secshare -2 sec.txt.enc s1 s2 

content=`cat ~/secshare/secshare/sec.txt.enc.dec`
if [ -z $content ]
then 
	echo "NULL";
else 
	echo "NOT NULL";
	echo $content
fi
