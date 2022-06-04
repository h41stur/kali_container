FROM kalilinux/kali-rolling

WORKDIR /resources

COPY .vimrc /root/
COPY .bashrc /root/

RUN apt update
RUN apt upgrade -y
RUN apt dist-upgrade -y
RUN apt install dbus-x11 packagekit-gtk3-module libcanberra-gtk3-0 -y
RUN apt install bash-completion -y
RUN echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install wireshark
RUN apt install kali-tools-top10 -y
RUN dbus-uuidgen > /etc/machine-id
RUN apt install -y sublist3r locate wget git vim golang python3 python3-pip feroxbuster nikto gem burpsuite hydra webshells whatweb xsser dirb dirbuster nmap proxychains4 tor sslscan wafw00f sqlmap wpscan telnet netcat-traditional whois host gobuster ffuf jq firefox-esr exa
RUN gem install evil-winrm
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
RUN mv /root/go/bin/subfinder /usr/bin/
RUN go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
RUN mv /root/go/bin/nuclei /usr/bin/
RUN nuclei -update-templates

COPY proxychains4.conf /etc/proxychains4.conf
