#!/bin/bash --login

echo "Get all threads"
./get-threads.sh
echo "Filter new threads"
cat ,threads | fresh.pl sis > ,new-threads
wc -l ,new-threads
echo "Get each thread"
cat ,new-threads | xargs -I , ./get-one-thread.sh ,

ls threads/ | grep -v dummy | sort -r | head -100 | xargs -I , find threads/, -name index.html | xargs -I , cat , > index.html
