FROM debian:unstable-slim
RUN apt update && apt install -y ansible git openssh-server python3-apt
RUN git clone https://github.com/dev-sec/ansible-ssh-hardening.git
RUN mkdir /run/sshd
COPY ssh/ssh-hardening.yaml . 
RUN ansible-playbook ssh-hardening.yaml

FROM alpine:edge
ENV USERS=sten
RUN apk add --update bash tmux pwgen openssh openssh-server
COPY --from=0 /etc/ssh/sshd_config /etc/ssh/sshd_config
COPY --from=0 /etc/ssh/ssh_config /etc/ssh/ssh_config
COPY --from=0 /etc/ssh/revoked_keys /etc/ssh/revoked_keys
RUN sed -i 's/DebianBanner.*//' /etc/ssh/sshd_config
COPY ssh/ssh-server.sh /ssh-server.sh
CMD /ssh-server.sh
