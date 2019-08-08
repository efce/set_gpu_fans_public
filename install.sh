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

dir=/opt/set-gpu-fans/
mkdir -p ${dir}
cp ./{cool_gpu,README.md,dfp-edid.bin,nvscmd,xorg.conf} ${dir}
cp ./set-gpu-fans.service /etc/systemd/system/
systemctl daemon-reload
