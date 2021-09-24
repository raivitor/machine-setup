NAME="Raí Vitor"
EMAIL="raivitor@gmail.com"

sudo apt update
sudo apt upgrade -y

echo 'installing curl' 
sudo apt install curl -y

echo 'installing git' 
sudo apt install git -y

echo "Config git"
git config --global user.name $NAME
git config --global user.email $EMAIL

echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y

echo "Generating a SSH Key"
ssh-keygen -t ed25519 -C $EMAIL -q
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard

echo 'installing spotify' 
snap install spotify

echo 'installing discord' 
snap install discord

echo 'installing beekeper' 
snap install beekeper

echo 'installing slack' 
sudo snap install slack --classic

echo 'Vs Code' 
sudo snap install code --classic

echo 'installing guake'
sudo apt install guake -y

echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing nvm' 
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm --version
nvm install 14
nvm alias default 14
node --version
npm --version

echo 'install docker'
sudo apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://get.docker.com -o get-docker.sh
DRY_RUN=1 sh ./get-docker.sh

echo 'installing docker-compose' 
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version