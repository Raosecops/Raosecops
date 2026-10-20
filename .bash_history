hostnamectl
sudo apt update && sudo apt upgrade -y
sudo apt install -y git wireshark curl traceroute net-tools nmap
ip addr
gnome-text-editor
gnome-browser
sudo apt install wmctrl
wmctrl -a firefix
wmctrl -a firefox
wmctrl -a "text editor"
wmctrl -a "Text Editor"
firefox &
text-editor &
wireshark &
text editor &
text-editor &
gnome text-editor
gedit &
ip link
ip addr
nmcli device status
genome-text-editor
gnome-text-editor
gnome-text-editpr
gnome-text-editor
ip link show
ip route show
ip neighbour show
ip route show
nmcl
nmci
nmcli
nmcli connection show
ip link show
ip route show
ip neighbour show
ip link 
ip addr
ip link show
ip neighbour show
nmcli connection clear
ip link show 
ip route show
ip neighbour show
ip addr
ip neighb show
sudo apt install arp-scan
arp-scan--localnet
arp-scan --localnet
gnome-text-editor
[200~sudo arp-scan --localnet~
sudo arp-scan --localnet
sudo apt update && sudo apt install flameshot
flameshot gui
flameshot config
ip show 
show ip
ip link show
ip route show
ip neighbour show
ip link show
clr
falmeshot gui
clear
flameshot gui
clear
flameshot gui
mkdir -p ~/projects/nebulaguard
~/projects/nebulaguard
nano provider.tf
nano network.tf
nano security_groups.tf
nano network.tf
nano security_groups.tf
nano network.tf
nano provider.tf
nano security_groups.tf
nano servers.tf
terraform validate
which terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install terraform
terraform -version
terraform validate
nano servers.tf
terraform validate
terraform init
terraform validate
terraform plan
terraform apply
docker ps
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce
docker --version
systemctl status docker
localstack start -d
sudo apt update
sudo apt install python3-pip -y
pip3 install localstack
localstack start -d
export PATH=$PATH:$HOME/.local/bin
localstack start -d
nano docker-compose.yml
docker compose up -d
curl http://localhost:4566/_localstack/init
newgrp docker
docker compose up -d
curl http://localhost:4566/_localstack/health
sudo docker compose up -d
sudo docker logs -f localstack_main
nano docker-compose.yml
sudo docker compose down
sudo docker compose up -d
sudo docker logs -f localstack_main
nano docker-compose.yml
sudo docker compose down
sudo docker compose up -d
sudo docker logs -f localstack_main
curl http://localhost:4566/_localstack/health
sudo docker compose down --volumes --remove-orphans
sudo docker rmi localstack/localstack:latest
sudo nano docker-compose.yml
sudo docker logs -f localstack_main
sudo docker compose pull 
sudo docker compose up -d
sudo docker logs -f localstack_main
terraform plan
terraform init
terraform apply
aws --endpoint-url=http://localhost:4566 ec2 describe-instances --query 'Reservations[*].Instances[*].{ID:InstanceId,Type:InstanceType,Status:State.Name}' --output table
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --output table
aws --endpoint-url=http://localhost:4566 ec2 describe-instances   --query 'Reservations[*].Instances[*].{ID:InstanceId,Subnet:SubnetId,Status:State.Name}'   --output table
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
aws --endpoint-url=http://localhost:4566 ec2 describe-instances   --query 'Reservations[*].Instances[*].{ID:InstanceId,Subnet:SubnetId,Status:State.Name}'   --output table
aws --version
aws configure
aws --endpoint-url=http://localhost:4566 ec2 describe-instances   --query 'Reservations[*].Instances[*].{ID:InstanceId,Subnet:SubnetId,Status:State.Name}'   --output table
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups   --group-names web_sg   --query 'SecurityGroups[*].IpPermissions'
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --group-names web_sg
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --group-ids YOUR_SG_ID_HERE
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --query 'SecurityGroups[*].{Name:GroupName,ID:GroupId}' --output table
aws --version 
aws config list 
aws configure list 
aws --endpoint-url=http://localhost:4566 ec2 describe-instances --query 'Reservations[*].Instances[*].{Name:Tags[0].Value,ID:InstanceId,Status:State.Name}' --output table
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --query 'SecurityGroups[*].{GroupName:GroupName,ID:GroupId}' --output tableaws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --query 'SecurityGroups[*].{GroupName:GroupName,ID:GroupId}' --output table
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --query 'SecurityGroups[*].{GroupName:GroupName,ID:GroupId}' --output table
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --group-ids sg-1230b99b6a3654ec4
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --group-ids sg-57f7a288adfccc421
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --group-ids sg-57f7a288adfccc421q
aws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --group-ids sg-57f7a288adfccc421qaws --endpoint-url=http://localhost:4566 ec2 describe-security-groups --group-ids sg-57f7a288adfccc421
[Aq
kldkdlsldklswdlgfgdfq
q
