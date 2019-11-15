# include this script in your .bash_functions or bash_aliases file and use
# it whenever you want to debug something on a cluster

function ktools () {
	if [ -z "${1}" ] 
	then
		name="tools"
	else
		name=${1}
	fi
	kubectl run ${name} --image dhrp/tools --generator=run-pod/v1 
}