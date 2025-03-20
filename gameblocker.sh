#!/bin/bash

# ask your password
echo "Enter your password:"
read -s password  # Store the input in 'name' variable

# read -s -p "Enter your password: " password  # Using -p to display the prompt inline

expected_hash=""

hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}')

if [ "$expected_hash" != "$hashed_password" ];
then
  echo "Password isn't correct!"
  exit 1
fi

echo "Enter your action (block or reset):"
read action

if [ "$action" == "reset" ]; then 
  echo "##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1	localhost
255.255.255.255	broadcasthost
::1             localhost" > /etc/hosts
fi

if [ "$action" == "block" ]; then 
  echo "127.0.0.1 youtube.com
127.0.0.1  netflix.com
127.0.0.1  roblox.com rbxcdn.com​
127.0.0.1  api.roblox.com
127.0.0.1  roblox.com
127.0.0.1  www.roblox.com
127.0.0.1  api.roblox.com
127.0.0.1  auth.roblox.com
127.0.0.1  presence.roblox.com
127.0.0.1  setup.roblox.com
127.0.0.1  www.rbxcdn.com
127.0.0.1  images.rbxcdn.com
127.0.0.1  m.roblox.com
127.0.0.1   web.roblox.com
127.0.0.1   twitch.tv
127.0.0.1   www.twitch.tv
127.0.0.1   roblox.com
127.0.0.1   www.roblox.com
127.0.0.1   miniclip.com
127.0.0.1   www.miniclip.com
127.0.0.1   crazygames.com
127.0.0.1   www.crazygames.com
127.0.0.1   poki.com
127.0.0.1   www.poki.com
127.0.0.1   kongregate.com
127.0.0.1   www.kongregate.com
127.0.0.1   addictinggames.com
127.0.0.1   www.addictinggames.com
127.0.0.1   armorgames.com
127.0.0.1   www.armorgames.com
127.0.0.1   newgrounds.com
127.0.0.1   www.newgrounds.com
127.0.0.1   pogo.com
127.0.0.1   www.pogo.com
  " >> /etc/hosts
  killall -HUP mDNSResponder
fi
