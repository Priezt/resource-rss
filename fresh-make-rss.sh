#!/bin/bash

WWW=$HOME/www/rss

echo $1
fresh.pl $1 | make-rss.py $1 | pp-xml.rb > $WWW/$1.xml
