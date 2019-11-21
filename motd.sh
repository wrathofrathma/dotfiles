#!/bin/bash
export TERM=xterm-256color
read one five fifteen rest < /proc/loadavg
SERVICES=(nginx plexmediaserver vsftpd sshd)
clear
echo "Welcome to ${HOSTNAME}" | lolcat -f
neofetch --color_blocks off
echo -n "Services: " | lolcat -f
for service in ${SERVICES[*]}
do
  echo -n "$service[$(systemctl is-active $service)] " | lolcat -f
done
echo ""
echo "Load Averages: ${one}, ${five}, ${fifteen} (1, 5, 15 min)" | lolcat -f
echo "Number of users logged in: $(users | wc -w)" | lolcat -f
echo "Pool Status" | lolcat -f
echo "$(zpool list)" | lolcat -f
echo "Disk Use: " | lolcat -f
echo "$(zfs list)" | lolcat -f
