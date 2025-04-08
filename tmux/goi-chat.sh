#!/bin/bash

SESH="go-cinema"
DIR="~/kishmishka/goi-chat"

tmux has-session -t $SESH 2>/dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESH -n "server-editor"

    tmux send-keys -t $SESH:server-editor "cd $DIR" C-m
    tmux send-keys -t $SESH:server-editor "nvim ." C-m

    tmux new-window -t $SESH -n "server"

    tmux send-keys -t $SESH:server "cd $DIR" C-m
    tmux send-keys -t $SESH:server "go run ." C-m

    tmux new-window -t $SESH -n "client-editor"

    tmux send-keys -t $SESH:client-editor "cd $DIR/web" C-m
    tmux send-keys -t $SESH:client-editor "nvim ." C-m

    tmux new-window -t $SESH -n "client"

    tmux send-keys -t $SESH:client "cd $DIR/web" C-m
    tmux send-keys -t $SESH:client "npm run dev" C-m

fi

tmux attach-session -t $SESH
