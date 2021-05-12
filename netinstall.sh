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

[ -d "/tmp/sjfetch-git/build/" ] || mkdir "/tmp/sjfetch-git/build"

g++ "/tmp/sjfetch-git/src/main.cpp" -o "/tmp/sjfetch-git/build/sjfetch" -lstdc++fs -lcurl # -std=c++17

cp -r "/tmp/sjfetch-git/build/sjfetch" "/usr/share/sjfetch/sjfetch"
cp -r "/tmp/sjfetch-git/ascii" "/usr/share/sjfetch"

ln -s "/usr/share/sjfetch/sjfetch" "/usr/bin/sjfetch"

echo ":: Done."
