#!/usr/bin/bash

if [ ! -x "$1" ]; then
	echo "Usage: $(basename $0) Executable" 
	exit 1
fi
function byebye() {
	reset
	exit 0
}
FILE="$1"
PS1=
trap 'byebye' SIGINT
echo -e "\e[?25l"

while :; do 
	time=$(stat -c %Y $FILE)
	if (( modified != time )); then
		modified=$time
		$FILE
	fi
	sleep 2
done
