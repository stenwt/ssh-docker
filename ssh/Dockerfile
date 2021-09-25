FROM debian:unstable-slim
RUN apt update && apt install -y ansible git openssh-server python3-apt
RUN mkdir /run/sshd
RUN ansible-galaxy collection install devsec.hardening
COPY ssh/ssh-hardening.yaml . 
RUN ansible-playbook ssh-hardening.yaml

FROM debian:unstable-slim
ENV USERS=sten
RUN apt update && apt install -y bash tmux pwgen openssh-client openssh-server && apt clean
RUN mkdir /run/sshd
COPY --from=0 /etc/ssh/sshd_config /etc/ssh/sshd_config
COPY --from=0 /etc/ssh/ssh_config /etc/ssh/ssh_config
COPY --from=0 /etc/ssh/revoked_keys /etc/ssh/revoked_keys
COPY ssh/ssh-server.sh /ssh-server.sh
CMD /ssh-server.sh
