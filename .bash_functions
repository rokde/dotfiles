# d runs various docker images
d () {
	ALIAS=$1
	shift 1
	
	IMAGE=
	COMMAND=
	PARAMS=
	
	case "$ALIAS" in
	"yarn")
		IMAGE="node:latest"
		COMMAND="yarn $@"
		PARAMS="--volume $PWD:/usr/src/app --volume $HOME:$HOME -w /usr/src/app"
		;;
	"npm")
		IMAGE="node:latest"
		COMMAND="npm $@"
		PARAMS="--volume $PWD:/usr/src/app --volume $HOME:$HOME -w /usr/src/app"
		;;
	"ng")
		IMAGE="trion/ng-cli:latest"
		COMMAND="sh -c ng set --global packageManager=yarn; ng $@"
		PARAMS="--volume $PWD:/app --volume $HOME/.cache/yarn:/tmp/.cache/yarn"
		;;
	"ng-serve")
		IMAGE="trion/ng-cli:latest"
		COMMAND="ng serve -host 0.0.0.0 $@"
		PARAMS="--volume $PWD:/app -p 127.0.0.1:4200:4200"
		;;
	"composer")
		IMAGE="composer:latest"
		COMMAND="$@"
		PARAMS="--tty --volume $PWD:/app --volume $SSH_AUTH_SOCK:/ssh-auth.sock --env SSH_AUTH_SOCK=/ssh-auth.sock"
		;;
	"laravel")
		IMAGE="composer:latest"
		COMMAND="create-project --prefer-dist laravel/laravel $@"
		PARAMS="--tty --volume $PWD:/app --volume $SSH_AUTH_SOCK:/ssh-auth.sock --env SSH_AUTH_SOCK=/ssh-auth.sock"
		;;
	"rancherize")
		IMAGE="ipunktbs/rancherize:2-stable"
		COMMAND="$@"
		PARAMS="--volume $HOME/.rancherize:/home/rancherize/.rancherize --volume /var/run/docker.sock:/var/run/docker.sock --volume $(pwd):$(pwd) -w $(pwd) -e USER_ID=$(id -u) -e GROUP_ID=$(id -g)"
		;;
	
	"--upgrade")
		echo "Upgrading all docker images"
		IMAGES="node:latest trion/ng-cli:latest composer:latest ipunktbs/rancherize:2-stable"
		for image in $IMAGES; do
			docker pull $image
		done
		return 0
		;;
	*)
		echo "docker alias script"
		echo
		echo "  d [ALIAS] [ALIAS-OPTIONS]"
		echo
		echo "These aliases are available:"
		echo "  composer ...     Runs composer"
		echo "  laravel new ...  Runs the laravel installer"
		echo "  ng ...           Runs angular cli, with yarn"
		echo "  ng-serve ...     Serves angular project with angular cli"
		echo "  npm ...          Runs npm"
		echo "  rancherize ...   Runs rancherize"
		echo "  yarn ...         Runs yarn"
		echo
		echo "We provide some maintenance stuff too:"
		echo "  --upgrade        Upgrades all used docker container"
		return 1
		;;
	esac
	
	
	CMD="docker run -it --rm $PARAMS --volume /etc/passwd:/etc/passwd:ro --volume /etc/group:/etc/group:ro --user $(id -u):$(id -g) $IMAGE $COMMAND"
	
	$CMD
}
