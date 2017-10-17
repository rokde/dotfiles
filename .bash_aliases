alias ng="docker run -u $(id -u) --rm -p 4200:4200 -v "$PWD":/app ipunktbs/docker-ng-cli:latest ng"
alias ngs="docker run -u $(id -u) --rm -p 4200:4200 -v "$PWD":/app ipunktbs/docker-ng-cli:latest ng serve -host 0.0.0.0"
alias gtt=" docker run --rm -it -v ~:/root kriskbx/gitlab-time-tracker $@"

alias npm="docker run -it --rm -p 4200:4200 -v "$PWD":/usr/src/app -w /usr/src/app --volume /etc/passwd:/etc/passwd:ro --volume /etc/group:/etc/group:ro --user $(id -u):$(id -g) node npm $@"
alias yarn="docker run -it --rm -p 4200:4200 -v "$PWD":/usr/src/app --volume $HOME:$HOME -w /usr/src/app --volume /etc/passwd:/etc/passwd:ro --volume /etc/group:/etc/group:ro --user $(id -u):$(id -g) node yarn $@"
alias composer="docker run --rm --interactive --tty --volume "$PWD":/app --volume $SSH_AUTH_SOCK:/ssh-auth.sock --volume /etc/passwd:/etc/passwd:ro --volume /etc/group:/etc/group:ro --user $(id -u):$(id -g) --env SSH_AUTH_SOCK=/ssh-auth.sock composer $@"

PATH="/home/rok/.yarn/bin:$PATH"
