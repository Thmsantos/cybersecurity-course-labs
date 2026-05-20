FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    iproute2 \
    iputils-ping \
    net-tools \
    dnsutils \
    curl \
    wget \
    netcat-openbsd \
    traceroute \
    tcpdump \
    tshark \
    nmap \
    vim \
    nano \
    && apt clean && rm -rf /var/lib/apt/lists/*

WORKDIR /lab

COPY . /lab/

RUN find /lab -type f -name "*.sh" -exec chmod +x {} \;

CMD ["sleep", "infinity"]