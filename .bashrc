alias update='sudo apt update && apt upgrade -y && apt autoremove -y'
alias mouse='eval $(xdotool getdisplaygeometry --shell); while true; do xdotool mousemove `rand -M $WIDTH` `rand -M $HEIGHT` && sleep $((`rand -M 300` + 120)); done;'
