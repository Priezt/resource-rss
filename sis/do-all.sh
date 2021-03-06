#!/bin/bash --login

date
echo "Get all threads"
./get-threads.sh
echo "Filter new threads"
cat ,threads | fresh.pl sis > ,new-threads
wc -l ,new-threads
echo "Get each thread"
cat ,new-threads | xargs -I , ./get-one-thread.sh ,

echo "Merge index.html"
ls threads/ | grep -v dummy | sort -r | head -100 | xargs -I , find threads/, -name index.html | xargs -I , cat , > ,index-content.html
cat index-header.html ,index-content.html index-tail.html > index.html

#cd /home/priezt/code/resource-rss/
#tar zcf sis.tar.gz sis
#cp sis.tar.gz ~/OneDrive/Temp/sis.tar.gz

#onedrive-d restart

