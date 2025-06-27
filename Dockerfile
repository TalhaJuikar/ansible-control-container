FROM alpine:3.22

RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-cryptography \
    py3-yaml \
    ca-certificates \
    tzdata \
    openssh-client \
    sshpass \
    git \
    curl \
    vim \
    bash \
    libffi \
    openssl \
    bash-completion \
    && ln -sf /usr/bin/python3 /usr/bin/python

RUN python3 -m venv /opt/ansible-venv \
    && /opt/ansible-venv/bin/pip install --no-cache-dir --upgrade pip wheel setuptools \
    && apk add --no-cache --virtual .build-deps \
        gcc \
        musl-dev \
        python3-dev \
        libffi-dev \
        openssl-dev \
        linux-headers \
    && /opt/ansible-venv/bin/pip install --no-cache-dir ansible ansible-lint \
    && apk del .build-deps

ENV PATH="/opt/ansible-venv/bin:${PATH}"
RUN mkdir -p /etc/ansible /workspace/playbooks \
    && echo '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts
WORKDIR /workspace
CMD ["bash"]