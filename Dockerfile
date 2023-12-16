FROM kalilinux/kali-rolling

WORKDIR /resources

COPY .vimrc /root/
COPY .bashrc /root/
COPY .bash_aliases /root/
COPY .bash-preexec.sh /root/
COPY .inputrc /root/

RUN set -eux; \
        apt update; \
        apt upgrade -y; \
        apt dist-upgrade -y; \
        echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections; \
        DEBIAN_FRONTEND=noninteractive apt-get install -y dbus-x11 packagekit-gtk3-module libcanberra-gtk3-0 bash-completion python3 python3-pip kali-tools-top10 wireshark default-jdk sublist3r locate wget git vim nikto gem hydra webshells whatweb xsser dirb dirbuster nmap proxychains4 tor sslscan wafw00f sqlmap wpscan telnet netcat-traditional whois host gobuster ffuf jq firefox-esr exa exploitdb bash-completion iputils-ping freerdp2-x11 x11-xkb-utils gdb hash-identifier dnsutils wapiti hashcat windows-binaries rdesktop ftp pipx smbclient seclists npm; \
        npm install --global jwt-cracker; \
        wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz -O /tmp/go.tar.gz; \
        rm -rf /usr/local/go; \
        tar -C /usr/local -xzf /tmp/go.tar.gz; \
        rm /tmp/go.tar.gz; \
        export PATH=$PATH:/usr/local/go/bin; \
        rm -f /usr/lib/python3.11/EXTERNALLY-MANAGED; \
        dbus-uuidgen > /etc/machine-id; \
        git clone https://github.com/longld/peda.git ~/peda; \
        echo "source ~/peda/peda.py" >> ~/.gdbinit; \
        pip install pwntools aort updog; \
        gem install evil-winrm; \
        go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest; \
        go install github.com/tomnomnom/unfurl@latest; \
        mv /root/go/bin/unfurl /usr/bin/; \
        git clone https://github.com/defparam/smuggler.git /opt/smuggler; \
        ln -sf /opt/smuggler/smuggler.py /usr/bin/smuggler; \
        git clone https://github.com/stark0de/nginxpwner.git /opt/nginxpwner; \
        chmod +x /opt/nginxpwner/install.sh; \
        /opt/nginxpwner/install.sh; \
        git clone https://github.com/s0md3v/Corsy.git /opt/Corsy; \
        mv /root/go/bin/subfinder /usr/bin/; \
        git clone https://github.com/h41stur/nina.git /opt/nina; \
        pip install -r /opt/nina/requirements.txt; \
        ln -sf /opt/nina/nina.py /usr/bin/nina; \
        wapiti --update; \
        go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest; \
        mv /root/go/bin/nuclei /usr/bin/; \
        nuclei -update-templates; \
        updatedb

COPY proxychains4.conf /etc/proxychains4.conf
COPY immodules.cache /usr/lib/x86_64-linux-gnu/gtk-3.0/3.0.0/immodules.cache
COPY environment /etc/environment

