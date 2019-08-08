#!/bin/bash
which tcsh &> /dev/null
has_tcsh="$?"
if [ $has_tcsh -ne 0 ]; then
	echo "This requires tcsh."
	exit 1
fi
if [ "$(id -u)" -ne 0 ]; then
	echo "This needs to be run as a root."
	exit 1
fi

dir="/opt/set-gpu-fans/"
mkdir -p ${dir}
cp -f ./{cool_gpu,README.md,dfp-edid.bin,nvscmd,xorg.conf} ${dir}
cp -f ./set-gpu-fans.service /etc/systemd/system/
cp -f ./Xwrapper.config /etc/X11/
chmod 755 ${dir}/cool_gpu
chmod 755 ${dir}/nvscmd
systemctl daemon-reload
