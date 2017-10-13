WAI='$PWD'
alias ng="docker run -u $(id -u) --rm -v "$WAI":/app ipunktbs/docker-ng-cli:latest ng"
alias ngs="docker run -u $(id -u) --rm -p 4200:4200 -v "$WAI":/app ipunktbs/docker-ng-cli:latest ng serve -host 0.0.0.0"
alias gtt=" docker run --rm -it -v ~:/root kriskbx/gitlab-time-tracker $*"

alias npm="docker run -it --rm -v "$WAI":/usr/src/app -w /usr/src/app --volume /etc/passwd:/etc/passwd:ro --volume /etc/group:/etc/group:ro --user $(id -u):$(id -g) node npm $@"
alias yarn="docker run -it --rm -v "$WAI":/usr/src/app --volume $HOME:$HOME -w /usr/src/app --volume /etc/passwd:/etc/passwd:ro --volume /etc/group:/etc/group:ro --user $(id -u):$(id -g) node yarn $@"
alias composer="docker run --rm --interactive --tty --volume "$WAI":/app --volume $SSH_AUTH_SOCK:/ssh-auth.sock --volume /etc/passwd:/etc/passwd:ro --volume /etc/group:/etc/group:ro --user $(id -u):$(id -g) --env SSH_AUTH_SOCK=/ssh-auth.sock composer $@"
