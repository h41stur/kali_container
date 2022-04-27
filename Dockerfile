FROM kalilinux/kali-rolling

WORKDIR /resources

COPY .vimrc /root/

RUN apt update
RUN apt upgrade -y
RUN apt dist-upgrade -y
RUN apt install dbus-x11 packagekit-gtk3-module libcanberra-gtk3-0 -y
RUN apt install bash-completion -y
RUN echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark
RUN apt install kali-tools-top10 -y
RUN dbus-uuidgen > /etc/machine-id
RUN apt install locate -y
RUN apt install wget -y
RUN apt install git -y
RUN apt install vim -y
RUN apt install golang -y
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN apt install feroxbuster -y
RUN apt install nikto -y
RUN apt install gem -y
RUN gem install evil-winrm
RUN apt install -y burpsuite hydra webshells whatweb xsser dirb dirbuster nmap proxychains4 tor sslscan wafw00f sqlmap wpscan
