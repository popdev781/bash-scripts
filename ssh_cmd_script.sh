#!/usr/bin/bash\

# run a ssh command on multiple host
# example bash ssh_cmd_script.sh user1@hostname user2@hostname

[ "$#" -lt 1 ] && printf "Please give at least one argument\n" && exit
#echo $@

login_check=1   #fail 1 success 0
server_list=$@
echo $server_list

# connect to servers and remove which are not accessable
for i in "$@"
do
	check=`ssh $i whoami`
	if [ $? -ne 0 ]; then
		server_list=( "${server_list[@]/$i}" )
		login_check=1;
#		exit; 
	else
		login_check=0;
	fi
done

# give a command prompt to type the command to execute on connected servers
read -p "enter command \$ " cmd
#echo $cmd

# run the command
for i in $server_list
do
ssh $i $cmd
done
