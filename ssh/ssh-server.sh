#!/bin/sh
for user in $USERS
  do adduser --gecos "" --disabled-password $user && \
  echo "$user:$(pwgen 32 1)" | /usr/sbin/chpasswd && \
  mkdir /home/$user/.ssh && \
  chmod 700 /home/$user/.ssh && \
  cp /mnt/pubkeys/$user /home/$user/.ssh/authorized_keys && \
  chmod 600 /home/$user/.ssh/authorized_keys && \
  chown -R $user /home/$user;
done; 
/usr/sbin/sshd -D
