if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run   ./install.sh" 2>&1
  exit 1
fi


username=$(id -u -n 1000)
builddir=$(pwd)

dpkg --add-architecture i386 

wget -nc https://dl.winehq.org/wine-builds/winehq.key
apt-key add winehq.key
add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y
add-apt-repository ppa:lutris-team/lutris -y
apt update
apt-get install --install-recommends winehq-staging -y
apt-get install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386 -y
apt-get install lutris -y
