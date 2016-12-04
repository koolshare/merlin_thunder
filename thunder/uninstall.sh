#!/bin/sh

rm -rf /koolshare/thunder
rm -rf /koolshare/init.d/S02Thunder.sh
rm -rf /koolshare/scripts/thunder_*.sh
rm -rf /koolshare/scripts/uninstall_thunder.sh
rm -rf /koolshare/webs/Module_thunder.asp
PID_all=`ps|grep -E "check_xware_guard|sh(.*)xunlei.sh|thunder|xunlei|xware|sleep 1m|sleep 10m"|grep -v grep|awk '{print $1}'`
kill ${PID_all}