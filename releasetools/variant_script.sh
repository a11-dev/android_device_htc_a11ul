#!/sbin/sh

set -e

modelid=`getprop ro.boot.mid`

case $modelid in
	0PCV10000|0PCV20000)    variant="chl" ;;
	*)                      variant="gsm" ;;
esac

basedir="/system/blobs/$variant/"
cd $basedir
chmod 755 bin/*
find . -type f | while read file; do ln -s $basedir$file /system/$file ; done