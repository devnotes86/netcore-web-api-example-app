sudo apt update
sudo apt install -y aspnetcore-runtime-8.0
sudo apt install -y dotnet-sdk-8.0

sudo mkdir /var/www
sudo mkdir /var/www/heavymetalbandsapi

sudo mkdir /home/deployments
sudo cp finish_deploy.sh /home/deployments/finish_deploy.sh

sudo chmod +x /home/deployments/finish_deploy.sh


sudo apt install nginx

sudo cp heavymetalbandsapi /etc/nginx/sites-available/heavymetalbandsapi

sudo ln -s /etc/nginx/sites-available/heavymetalbandsapi /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx

sudo cp heavymetalbandsapi.service /etc/systemd/system/heavymetalbandsapi.service

sudo systemctl daemon-reexec
sudo systemctl enable heavymetalbandsapi
sudo systemctl restart heavymetalbandsapi

