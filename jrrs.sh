#!/bin/bash

WWW=$HOME/www/rss

echo $1
fresh.pl $1 | j.push-rss $1
j.get-rss $1 > $WWW/$1.xml
