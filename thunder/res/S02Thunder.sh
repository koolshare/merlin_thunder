#!/bin/sh

# 引用环境变量等
source /koolshare/scripts/base.sh

# 导入skipd数据
eval `dbus export thunder`

# 开机自启
start_with_system() {
	if [ "$thunder_basic_request"x == "01"x ]; then
		wget -4 --spider --quiet --tries=2 --timeout=2 www.baidu.com
		if [ "$?" == "0" ]; then
			logger "[软件中心]: 网络正常，启动迅雷"
			sh /koolshare/thunder/xunlei.sh
		else
			logger "[软件中心]: 网络异常，不启动迅雷"
		fi
	else
		logger "[软件中心]: 迅雷未设置开机启动，跳过！"
		dbus set thunder_basic_request=00
	fi
}

case $ACTION in
start)
	start_with_system
	;;
esac