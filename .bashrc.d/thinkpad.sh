screenon() {
    xrandr --output eDP-1 --auto
}

screenoff() {
    xrandr --output eDP-1 --off
}

bstatus() {
    upower -i /org/freedesktop/UPower/devices/battery_BAT0
}

[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

source /usr/share/nvm/init-nvm.sh

export TMPDIR=/var/tmp
export PATH=$PATH:$HOME/google-cloud-sdk/bin

alias vpnup='sudo systemctl start openvpn-client@client.service'
alias vpndown='sudo systemctl stop openvpn-client@client.service'
