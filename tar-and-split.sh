#!/bin/sh

rm t/*
tar zcf sis.tar.gz sis
mv sis.tar.gz t
cd t
split -b 10m sis.tar.gz
rm sis.tar.gz

