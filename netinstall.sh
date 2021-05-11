if [ "$EUID" -ne 0 ]
    then echo ":: sjfetch installation script must be run as root."
    exit
fi

echo ":: Downloading..."

[ -d "/tmp/sjfetch-git" ] && rm -rf "/tmp/sjfetch-git"
[ -d "/usr/share/sjfetch" ] && rm -rf "/usr/share/sjfetch"
[ -L "/usr/bin/sjfetch" ] && rm -rf "/usr/bin/sjfetch"

git clone "https://github.com/fikret0/sjfetch.git" "/tmp/sjfetch-git"
mkdir "/usr/share/sjfetch"

echo ":: Installing..."

/tmp/sjfetch-git/install.sh

echo ":: Done."
