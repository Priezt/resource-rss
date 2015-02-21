#!/bin/sh

cd ~/code/resource-rss/sis/threads

COUNT=$(expr $(ls | sort | wc -l) - 150)

echo REMOVING $COUNT THREADS

if [ $COUNT -gt 0 ] ;
then
	ls | head -$COUNT | grep ^9 | xargs -I , rm -rf , ;
fi

