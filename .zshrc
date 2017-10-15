composer () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --user $(id -u):$(id -g) \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume $(pwd):/app \
        composer "$@"
}

laravel () {
    USAGE="$0 new [project-directory]"
    if [ $# -lt 2 ]; then
        echo "$USAGE"
        return 1
    fi

    shift 1
    composer create-project --prefer-dist laravel/laravel "$1"
    cd "$1"
}
