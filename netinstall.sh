if [ "$EUID" -ne 0 ]
    then echo ":: sjfetch installation script must be run as root."
    exit
fi

echo ":: Downloading..."

[ -f "/tmp/sjfetch.zip" ] && rm -rf "/tmp/sjfetch.zip"
[ -d "/usr/share/sjfetch" ] && rm -rf "/usr/share/sjfetch"
[ -L "/usr/bin/sjfetch" ] && rm -rf "/usr/bin/sjfetch"

wget "https://github.com/fikret0/sjfetch/releases/download/1.0/sjfetch.zip" -O "/tmp/sjfetch.zip"
mkdir "/usr/share/sjfetch"

echo ":: Installing..."

unzip "/tmp/sjfetch.zip" -d "/usr/share/sjfetch"
ln -s "/usr/share/sjfetch/sjfetch" "/usr/bin/sjfetch"

echo ":: Done."
