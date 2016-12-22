#!/bin/sh

process_of()
{
	process=$(echo "$@" | awk '{ print substr($0, index($0,$5)) }');
	for i in $process; do
		ps|grep -E $i|grep -v grep
	done
}

rm -rf /koolshare/thunder
rm -rf /koolshare/init.d/S02Thunder.sh
rm -rf /koolshare/scripts/thunder_*.sh
rm -rf /koolshare/scripts/uninstall_thunder.sh
rm -rf /koolshare/webs/Module_thunder.asp
#rm -rf /tmp/thunder*
rm -rf /tmp/xunlei*
PID_all=`process_of 'EmbedThunderManager|ETMDaemon|vod_httpserver|check_xware_guard|thunder|xunlei|xware|sleep 1m|sleep 10m'|awk '{print $1}'`
until [ -z `process_of 'EmbedThunderManager|ETMDaemon|vod_httpserver|check_xware_guard|thunder|xunlei|xware'` ]; do
	kill ${PID_all}
done;
