#!/bin/sh -x
for user in $USERS
  do adduser -s /bin/bash -D -h /home/$user $user && \
  echo "$user:$(pwgen 32 1)" | /usr/sbin/chpasswd && \
  mkdir /home/$user/.ssh && \
  chmod 700 /home/$user/.ssh && \
  cp /mnt/pubkeys/$user /home/$user/.ssh/authorized_keys && \
  chmod 600 /home/$user/.ssh/authorized_keys && \
  chown -R $user /home/$user;
done; 
chmod 600 /etc/ssh/*
/usr/sbin/sshd -D
