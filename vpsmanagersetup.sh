#!/bin/bash
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "VPS Manager 2.0 (versão gratuita)" ; tput sgr0
tput setaf 3 ; tput bold ; echo "" ; echo "Este script irá:" ; echo ""
echo "● Instalar e configurar o proxy squid nas portas 80, 3128, 8080 e 8799" ; echo "  para permitir conexões SSH para este servidor"
echo "● Configurar o OpenSSH para rodar nas portas 22 e 443"
echo "● Instalar um conjunto de scripts como comandos do sistema para o gerenciamento de usuários" ; tput sgr0
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
tput setaf 2 ; tput bold ; echo "	Termos de Uso" ; tput sgr0
echo ""
echo "Ao utilizar esta versão GRATUITA do 'VPS Manager 2.0' você concorda com os seguintes termos de uso:"
echo ""
echo "1. Você pode:" 
echo "a. Instalar e usar o 'VPS Manager 2.0' no(s) seu(s) servidor(es)." 
echo "b. Criar, gerenciar e remover um número ilimitado de usuários através desse conjunto de scripts." 
echo "" 
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
echo "2. Você não pode:" 
echo "a. Editar, modificar, compartilhar ou redistribuir (gratuitamente ou comercialmente)" 
echo "esse conjunto de scripts sem autorização do desenvolvedor." 
echo "b. Modificar ou editar o conjunto de scripts para fazer você parecer o desenvolvedor dos scripts." 
echo "" 
echo "3. Você aceita que:" 
echo "a. Esta cópia GRATUITA do VPS Manager 2.0 não inclui NENHUM tipo garantia ou suporte, sendo estes exclusivos da versão paga do VPS Manager 2.0."
echo "" 
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
echo "4. Você concorda que o desenvolvedor não se responsabilizará por qualquer tipo de problemas ocorridos durante o uso dessa versão GRATUITA do VPS Manager 2.0."
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
read -p "Para continuar digite o IP deste servidor: " ipdovps
if [ -z "$ipdovps" ]
then
	tput setaf 7 ; tput setab 1 ; tput bold ; echo "" ; echo "" ; echo " Você não digitou o IP deste servidor. Tente novamente. " ; echo "" ; echo "" ; tput sgr0
	exit 1
fi
tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Aguarde a configuração automática" ; echo "" ; tput sgr0
sleep 3
apt-get update -y
apt-get upgrade -y
rm /bin/criarusuario /bin/expcleaner /bin/sshlimiter /bin/addhost /bin/listar /bin/sshmonitor /bin/ajuda > /dev/null
rm /root/ExpCleaner.sh /root/CriarUsuario.sh /root/sshlimiter.sh > /dev/null
apt-get install squid3 bc screen nano unzip dos2unix wget -y
killall apache2
apt-get purge apache2 -y
if [ -d "/etc/squid3/" ]
then
	wget http://phreaker56.site88.net/GRT11111/squid1.text -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget http://phreaker56.site88.net/GRT11111/squid2.text -O /tmp/sqd3
	cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid3/squid.conf
	wget http://phreaker56.site88.net/GRT11111/payload.text -O /etc/squid3/payload.txt
	echo " " >> /etc/squid3/payload.txt
	grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 443" >> /etc/ssh/sshd_config
	wget http://phreaker56.site88.net/GRT11111/314519/addhost.sh -O /bin/addhost
	chmod +x /bin/addhost
	wget http://phreaker56.site88.net/GRT11111/314519/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	wget http://phreaker56.site88.net/GRT11111/314519/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	wget http://phreaker56.site88.net/GRT11111/314519/delhost.sh -O /bin/delhost
	chmod +x /bin/delhost
	wget http://phreaker56.site88.net/GRT11111/314519/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	wget http://phreaker56.site88.net/GRT11111/314519/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	wget http://phreaker56.site88.net/GRT11111/314519/remover.sh -O /bin/remover
	chmod +x /bin/remover
	wget http://phreaker56.site88.net/GRT11111/314519/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	wget http://phreaker56.site88.net/GRT11111/314519/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	wget http://phreaker56.site88.net/GRT11111/314519/ajuda.sh -O /bin/ajuda
	chmod +x /bin/ajuda
	wget http://phreaker56.site88.net/GRT11111/314519/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	if [ ! -f "/etc/init.d/squid3" ]
	then
		service squid3 reload > /dev/null
	else
		/etc/init.d/squid3 reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi	
fi
if [ -d "/etc/squid/" ]
then
	wget http://phreaker56.site88.net/GRT11111/squid1.text -O /tmp/sqd1
	echo "acl url3 dstdomain -i $ipdovps" > /tmp/sqd2
	wget http://phreaker56.site88.net/GRT11111/squid.text -O /tmp/sqd3
	cat /tmp/sqd1 /tmp/sqd2 /tmp/sqd3 > /etc/squid/squid.conf
	wget http://phreaker56.site88.net/GRT11111/payload.text -O /etc/squid/payload.txt
	echo " " >> /etc/squid/payload.txt
	grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 443" >> /etc/ssh/sshd_config
	wget http://phreaker56.site88.net/GRT11111/314519/2/addhost.sh -O /bin/addhost
	chmod +x /bin/addhost
	wget http://phreaker56.site88.net/GRT11111/314519/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	wget http://phreaker56.site88.net/GRT11111/314519/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	wget http://phreaker56.site88.net/GRT11111/314519/2/delhost.sh -O /bin/delhost
	chmod +x /bin/delhost
	wget http://phreaker56.site88.net/GRT11111/314519/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	wget http://phreaker56.site88.net/GRT11111/314519/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	wget http://phreaker56.site88.net/GRT11111/314519/remover.sh -O /bin/remover
	chmod +x /bin/remover
	wget http://phreaker56.site88.net/GRT11111/314519/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	wget http://phreaker56.site88.net/GRT11111/314519/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	wget http://phreaker56.site88.net/GRT11111/314519/ajuda.sh -O /bin/ajuda
	chmod +x /bin/ajuda
	wget http://phreaker56.site88.net/GRT11111/314519/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	if [ ! -f "/etc/init.d/squid" ]
	then
		service squid reload > /dev/null
	else
		/etc/init.d/squid reload > /dev/null
	fi
	if [ ! -f "/etc/init.d/ssh" ]
	then
		service ssh reload > /dev/null
	else
		/etc/init.d/ssh reload > /dev/null
	fi
fi
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Proxy Squid Instalado e rodando nas portas: 80, 3128, 8080 e 8799" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "OpenSSH rodando nas portas 22 e 443" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Scripts para gerenciamento de usuário instalados" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Leia a documentação para evitar dúvidas e problemas!" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Para ver os comandos disponíveis use o comando: ajuda" ; tput sgr0
echo ""
awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
exit 1