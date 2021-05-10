if [ "$EUID" -ne 0 ]
    then echo ":: sjfetch installation script must be run as root."
    exit
fi

[ -d "/usr/share/sjfetch" ] && rm -rf "/usr/share/sjfetch"
[ -L "/usr/bin/sjfetch" ] && rm -rf "/usr/bin/sjfetch"

mkdir "/usr/share/sjfetch"

echo ":: Building..."

[ -d "build/" ] || mkdir "build"

./build.sh

echo ":: Copying files..."

cp -r "build/sjfetch" "/usr/share/sjfetch/sjfetch"
cp -r "ascii" "/usr/share/sjfetch"

ln -s "/usr/share/sjfetch/sjfetch" "/usr/bin/sjfetch"

echo ":: Done."
