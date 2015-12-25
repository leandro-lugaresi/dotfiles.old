# Ubuntu-only stuff. Abort if not Ubuntu.
is_ubuntu || return 1

# install erlang lang
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb

sudo apt-get -qq update

sudo apt-get -qq install esl-erlang

#Install Elixir
sudo apt-get -qq install elixir
