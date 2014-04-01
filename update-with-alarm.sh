#!/bin/bash --login

alarm() { perl -e 'alarm shift; exec @ARGV' $@; }

cd /home/priezt/code/resource-rss
alarm 600 ./update.sh
