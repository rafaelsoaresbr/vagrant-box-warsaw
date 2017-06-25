#!/bin/sh

# Escolha sua timezone aqui: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
TZ="America/Sao_Paulo"
WARSAW_URL="https://cloud.gastecnologia.com.br/cef/warsaw/install/GBPCEFwr64.deb"

sudo timedatectl set-timezone $TZ && \
#
# Instalando atualizações
echo 'Atualizando o sistema...'
sudo apt-get update && sudo apt-get upgrade -y
#
# Instalação e configuração do login automático (rungetty) e do ambiente gráfico.
sudo apt-get install rungetty xserver-xorg xvfb xinit xterm blackbox firefox -y && \
sudo sed -i 's/^exec .*/exec \/sbin\/rungetty --autologin vagrant tty1/' /etc/init/tty1.conf && \
echo 'session.screen0.enableToolbar:  False' > /home/vagrant/.blackboxrc && \
echo 'if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi' >> /home/vagrant/.profile && \
# Hack pra criar um perfil no firefox sem ter um display gráfico.
# Durante a instalação do warsaw ele instala uns certificados nos perfis existentes do firefox.
# Então tem que criar um perfil antes de instalar o warsaw, senão dá pau. (!)
# http://superuser.com/questions/1092735/create-firefox-profile-in-virtual-terminal
xvfb-run firefox -CreateProfile default && \
cp /etc/X11/xinit/xinitrc /home/vagrant/.xinitrc && \
sed -i -e "2i firefox &" /home/vagrant/.xinitrc && \
sed -i -e "3i /usr/local/bin/warsaw/core &" /home/vagrant/.xinitrc && \
#
# Dependências e instalação do warsaw
sudo apt-get install libcurl3 libnss3-tools -y && \
sudo wget -nv "$WARSAW_URL" -P /tmp && \
sudo dpkg -i /tmp/*.deb && \
#
sudo reboot
