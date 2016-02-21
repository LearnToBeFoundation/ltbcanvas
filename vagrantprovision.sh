# update the apt-get
sudo apt-get update

# install qt
sudo apt-get -y install qt5-default
sudo apt-get -y install libqt5webkit5-dev
sudo apt-get -y install libgmp3-dev

# install and set up postgresql
sudo apt-get -y install postgresql postgresql-contrib
sudo apt-get -y install libpq-dev
sudo /etc/init.d/postgresql restart
sudo -i -u postgres createuser -s -r vydia -U postgres
sudo -u postgres psql -c "alter role vydia with password 'vydia';"

# install nodejs
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get -y install nodejs
npm install -g bower

cd ltbcanvas

# install rvm and ruby-2.3
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm use --default --install ruby-2.3.0

# install git
sudo apt-get -y install git

# install java
sudo apt-get -y install default-jre

# install heroku toolbelt
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# install all the gems with bundle
gem install bundler
bundle install