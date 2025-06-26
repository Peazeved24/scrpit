#1---------------------------por amostrar o nome do meu  sistema.
Architecture=$(uname -a)
#2---------------------------numero de processadores fisicos
P_cpus=$(lscpu |grep "Socket(s):" | awk '{print $2}')
#3-numero de  processadores virtuais
V_cpus=$(nproc)
#4---------------------------RAM
#- o valor maximo
T_ram=$(free -m|grep "Mem:" | awk '{print $2}')
#- o valor a ser  utilizado
U_ram=$(free -m|grep "Mem:" | awk '{print $3}')
#- valor em % usado
Pu_ram =$(free | grep "Mem:" |awk '{printf("%.2f%%", $3/$2 * 100)}')
#5---------------------------DISK
#-o valor maximo
M_size=$(df -BG --total| grep "total"| awk '{print $2}')
#-o valor a ser usado
U_size=$(df -BM --total| grep "total"| awk '{print $3}')
#- o valor em %  de uso 
Pu_size=$(df --total | grep "total" | awk '{printf("%.2f%%", $3/$2 * 100)}')
#6---------------------------CPU
C_load=$(top -bn1 | grep "%Cpu(s):" | awk '{printf ("%.2f%%", $2 + $4)}')
#7---------------------------LastBoot
L_B=$(who -b | awk '{print $3, $NF}')
#8--------------------------LVMuse
Lv_O/F=$(if lsblk | grep -q lvm; then echo "on"; else echo "off"; fi)
#9--------------------------TCP
Est_tcp=$(ss -t state established|tail -n +2 | wc -l)
#10--------------------------User
Log_us=$(who|uniq | wc -l)
#11--------------------------Network
IP=$( hostname -I | awk '{print $1}')
MAC=$(ip link| grep "link/ether"| awk '{print $2}' | head -n1)
#12--------------------------Sudo
Sudo_count=$(journalctl -q _COMM=sudo | wc -l)
