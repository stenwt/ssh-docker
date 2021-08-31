FROM alpine:edge
ENV USERS=sten
RUN apk add --update bash tmux pwgen openssh openssh-server
COPY ssh/ssh-server.sh /ssh-server.sh
CMD /ssh-server.sh
