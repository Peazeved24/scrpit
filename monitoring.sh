
#1-por amostrar o nome do meu  sistema.
Architecture=$(uname -a)
#2-numero de processadores fisicos
P_cpus=$(lscpu |grep "Socket(s):" | awk '{print $2}')
#3-numero de  processadores virtuais
V_cpus=$(nproc)
#4-RAM
#- o valor maximo
T_ram=$(free --mega|grep "Mem:" | awk '{print $2}')
#- o valor a ser  utilizado
U_ram=$(free --mega|grep "Mem:" | awk '{print $3}')
#- valor em % usado
Pu_ram =$(free | grep "Mem:" |awk '{printf("%.2f%%", $3/$2 * 100)}')
#5-DISK
#-o valor maximo
M_size=$(df -BG --total| grep "total"| awk '{print $2}')
#-o valor a ser usado
U_size=$(df -BM --total| grep "total"| awk '{print $3}')
#- o valor em %  de uso 
Pu_size=$(df --total| grep "total" | awk '{printf("%.2f%%", $3/$2 * 100)}')
#CPU load
