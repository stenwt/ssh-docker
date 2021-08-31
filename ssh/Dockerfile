FROM alpine:edge
ENV USERS=sten
RUN apk add --update bash tmux pwgen openssh openssh-server
COPY /drone/src/ssh-setup.sh /ssh-setup.sh
CMD /ssh-setup.sh
