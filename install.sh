# edit this file before using
echo 'export LUNCHBOX_WS="/workspace/<username>"' >> ~/.zshrc
# echo 'export LUNCHBOX_WS="/workspace/<username>"' >> ~/.bashrc
echo 'LUNCHBOX_WS added'
echo 'Please add lunchbox in ~/.ssh/config as follows:'
echo 'Host lunchbox
  HostName <HostName>
  User <UserName>'
ln -s "$(pwd)/lunchbox" /usr/local/bin/lunchbox
