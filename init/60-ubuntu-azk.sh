# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

# Install Docker
curl -sSL https://get.docker.com/ | sudo sh


#Install AZK
sudo usermod -aG docker $(id -un)

wget -nv http://azk.io/install.sh -O- -t 2 -T 10 | sudo sh
