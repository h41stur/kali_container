###########################
# CUSTOM ALIASES
###########################

alias checkip="while :; do clear; curl ip-api.com; sleep 30; done"
alias untar="tar -zxvf"
alias grep='grep --color'
alias ls="exa -lh --icons  --classify --sort=ext --group-directories-first -S --color-scale"
alias lr="exa -lR  --classify --sort=ext --group-directories-first -S --color-scale"
alias https='openssl s_client -connect'
alias nuclei='nuclei -t /root/nuclei-templates/'
alias nginxpwner='python3 /opt/nginxpwner/nginxpwner.py'
alias nginxpwner-no-header='python3 /opt/nginxpwner/nginx-pwner-no-server-header.py'
alias corsy='python3 /opt/Corsy/corsy.py'
alias aort='aort --quiet'
