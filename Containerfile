FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

ARG CONFIG_FILE=rsyslog.conf

RUN microdnf upgrade && \
    microdnf install -y rsyslog && \
    microdnf clean all

COPY $CONFIG_FILE /etc/rsyslog.conf

CMD ["rsyslogd", "-n"]
