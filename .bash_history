whoami
date
hostname
source /etc/os-release && echo "$PRETTY_NAME"
uptime -p
lshw -class processor | grep 'product' | awk -F ': ' '{print $2}'
free -h | awk '/^Mem:/ {print $2}'
lsblk -o MODEL,SIZE | tail -n +2
lshw -class display | grep 'product' | awk -F ': ' '{print $2}'
hostname -f
ip -4 a show scope global | grep inet | awk '{print $2}' | cut -d/ -f1
ip r | grep default | awk '{print $3}'
grep "^nameserver" /etc/resolv.conf | awk '{print $2}' | paste -sd ', '
who | awk '{print $1}' | sort | uniq | paste -sd ', '
ps aux | wc -l
uptime | awk -F 'load average: ' '{print $2}'
ss -tuln | awk 'NR>1 {print $5}' | cut -d: -f2 | sort -nu | paste -sd ', '
sudo ufw status | grep -oE 'Status: (active|inactive)' | awk '{print $2}'
nano sysinfo.sh
chmod +x sysinfo.sh
./sysinfo.sh
git init
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
sudo apt update && sudo apt install git -y
git config --global user.name "Naresh Devabhai Chaudhary"
git config --global user.email "nareshchaudhary1706@gmail.com"
cd /path/to/your/script
cd ~
git init
git add sysinfo.sh
git commit -m "Added system info script"
cd ~/Documents
nano system_info.sh
chmod +x system_info.sh
./system_info.sh
cd ~/Documents
git init
git remote add origin https://github.com/nareshchaudhary1706/systemReportScript.git
nano system_report.sh
ls -l
cat system_report.sh
cat  system_info.sh
git add system_info.sh
git commit -m "Initial commit - Added system report script"
git branch -M main
git push -u origin main
wget -O ~/repositoryname/makecontainers.sh https://github.com/zonzorp/COMP2137/raw/main/makecontainers.sh && chmod +x ~/repositoryname/makecontainers.sh
~/repositoryname/makecontainers.sh --prefix server --count 2 --fresh
ssh remoteadmin@server1-mgmt
ls -l
wget -O ~/makecontainers.sh https://github.com/zonzorp/COMP2137/raw/main/makecontainers.sh
ping -c 4 google.com
ping -c 4 github.com
nslookup raw.githubusercontent.com
sudo systemctl restart systemd-resolved
nano ~/makecontainers.sh
wget -O ~/makecontainers.sh https://github.com/zonzorp/COMP2137/raw/main/makecontainers.sh
chmod +x ~/makecontainers.sh
~/makecontainers.sh --prefix server --count 2 --fresh
ps aux | grep makecontainers.sh
kill -9 <PID>
-bash: syntax error near unexpected token `newline'
student@generic-vm:~$







ps aux | grep makecontainers.sh
student   1234  0.0  0.1  12345  6789 ?   S    10:00   0:00 /bin/bash /home/student/makecontainers.sh
1234  0.0  0.1  12345  6789 ?   S    10:00   0:00 /bin/bash /home/student/makecontainers.sh
kill -9 1234
ps aux | grep makecontainers.sh
~/makecontainers.sh --prefix server --count 2 --fresh
ps aux | grep makecontainers.sh
docker ps
kill -9 3436 3710
ps aux | grep makecontainers.sh
ls -l ~/makecontainers.sh
rm ~/makecontainers.sh
wget -O ~/makecontainers.sh https://github.com/zonzorp/COMP2137/raw/main/makecontainers.sh
ls -l ~/makecontainers.sh
rm ~/makecontainers.sh
wget -O ~/makecontainers.sh https://raw.githubusercontent.com/zonzorp/COMP2137/main/makecontainers.sh
ping -c 4 google.com
wget -4 -O ~/makecontainers.sh https://raw.githubusercontent.com/zonzorp/COMP2137/main/makecontainers.sh
ls -l ~/makecontainers.sh
chmod +x ~/makecontainers.sh
ls -l ~/makecontainers.sh
~/makecontainers.sh --prefix server --count 2 --fresh
sudo reboot
hostname -I
~/makecontainers.sh --prefix server --count 2 --fresh
sudo apt update
sudo apt install incus -y
getent group incus
getent group incus-admin
sudo groupadd incus
sudo groupadd incus-admin
sudo usermod -aG incus,incus-admin $USER
sudo reboot
