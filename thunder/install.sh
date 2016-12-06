#! /bin/sh
cd /tmp
if [ -e /koolshare/thunder/lib ]; then
	cp -rf /tmp/thunder/thunder/*.sh /koolshare/thunder/
else
	cp -rf /tmp/thunder/thunder /koolshare/
fi
cp -rf /tmp/thunder/scripts/* /koolshare/scripts/
cp -rf /tmp/thunder/webs/* /koolshare/webs/
cp -rf /tmp/thunder/init.d/* /koolshare/init.d/
cp -rf /tmp/thunder/res/* /koolshare/res/
PID_all=`ps|grep -E "thunder|xunlei|xware|sleep 1m|sleep 10m"|grep -v grep|awk '{print $1}'`
kill ${PID_all}
sh /koolshare/thunder/*.sh
cd /
rm -rf /tmp/thunder* >/dev/null 2>&1

if [ -f /koolshare/init.d/S70Thunder.sh ];then
	rm -rf /koolshare/init.d/S70Thunder.sh
fi

if [ -L /koolshare/init.d/S70Thunder.sh ];then
	rm -rf /koolshare/init.d/S70Thunder.sh
fi

rm -rf /koolshare/init.d/S91thunder.sh
dbus remove __event__onwanstart_wan-start

chmod 755 /koolshare/thunder/*
chmod 755 /koolshare/scripts/*
chmod 755 /koolshare/init.d/*

