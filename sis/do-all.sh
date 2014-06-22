#!/bin/bash --login

echo "Get all threads"
./get-threads.sh
echo "Filter new threads"
cat ,threads | fresh.pl sis > ,new-threads
wc -l ,new-threads
echo "Get each thread"
cat ,new-threads | xargs -I , ./get-one-thread.sh ,
