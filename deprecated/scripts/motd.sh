#!/bin/bash
export TERM=xterm-256color
read one five fifteen rest < /proc/loadavg
SERVICES=(nginx plexmediaserver sshd syncthing@rathma docker mariadb vncserver@:1)
clear
chafa /opt/dotfiles/1n39ca69g8e21.png
figlet -f slant "Welcome to ${HOSTNAME}" | lolcat -f
neofetch --color_blocks off --off | grep -v "Terminal" | grep -v "Host" | grep -v "holyland" | grep -v "\-\-"| awk 'NF' | lolcat -f
echo -n "Services: " | lolcat -f
for service in ${SERVICES[*]}
do
  echo -n "$service[$(systemctl is-active $service)] " | lolcat -f
done
echo ""
echo "Load Averages: ${one}, ${five}, ${fifteen} (1, 5, 15 min)" | lolcat -f
echo "Number of users logged in: $(users | wc -w)" | lolcat -f
echo "Pool Status" | lolcat -f
# echo "$(zpool list)" | lolcat -f
# echo "Disk Use: " | lolcat -f
#echo "$(zfs list | grep -v 'zdata/docker/')" | lolcat -f
# echo "$(zfs list zdata/tank zdata/docker zdata/http/repo zdata/tank/media zdata/tank/torrents)" | lolcat -f
