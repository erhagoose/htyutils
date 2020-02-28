#!/bin/sh
usage() {
    cat - <<EOF
Usage:
    lunchbox push [DST_FOLDER]
    lunchbox pull [DST_FOLDER]
    Requirements:
    Add host "lunchbox" in ~/.ssh/config
    Specifiy workspace path: export LUNCHBOX_WS=/workspace/<username>
EOF
}
DIRNAME=$(basename `pwd`)
push() {
    if [ "$#" -gt 1 ]; then
        DIRNAME=$(basename `pwd`)
    fi
    rsync -rlptz --progress --delete --exclude=.git . "lunchbox:$LUNCHBOX_WS/$DIRNAME"
}

pull() {
    if [ "$#" -eq 0 ]; then
        usage
        exit 1
    fi
}

if [ "$#" -eq 0 ]; then
    usage
    exit 1
fi

if [ "$#" -eq 1 ]; then
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        usage
        exit 0
    fi
    if [ "$1" = "push" ]; then
        push
        exit 0
    fi
    if [ "$1" = "pull" ]; then
        pull
        exit 0
    fi
fi

if [ "$#" -eq 2 ]; then
    if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        usage
        exit 0
    fi
    if [ "$1" = "push" ]; then
        push "$2"
        exit 0
    fi
    if [ "$1" = "pull" ]; then
        pull "$2"
        exit 0
    fi
fi

if [ "$#" -gt 2 ]; then
    usage
    exit 0
fi
