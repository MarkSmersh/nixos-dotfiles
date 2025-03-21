#!/bin/bash

SESH="go-cinema"
DIR="~/kishmishka/go-cinema"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESH -n "editor"

    tmux send-keys -t $SESH:editor "cd $DIR" C-m
    tmux send-keys -t $SESH:editor "nvim ." C-m

    tmux new-window -t $SESH -n "server"

    tmux send-keys -t $SESH:server "cd $DIR" C-m
    tmux send-keys -t $SESH:server "go run ." C-m

    tmux new-window -t $SESH -n "client"

    tmux send-keys -t $SESH:client "cd $DIR/web" C-m
    tmux send-keys -t $SESH:client "npm run dev" C-m

fi

tmux attach-session -t $SESH
