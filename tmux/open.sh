#!/bin/bash

# Set session name
SESSION_NAME="my_session"

# Start a new tmux session in detached mode
tmux new-session -d -s $SESSION_NAME -c "w"

# Split the first window vertically
tmux split-window -h -p 25 -t $SESSION_NAME -c $1
# Focus on the left pane and start helix
tmux select-pane -t 1
tmux send-keys "hx $1" C-m

# Switch focus to the right pane
tmux select-pane -t 2

# Create a new window for RSB
tmux new-window -t $SESSION_NAME -n "bench" -c "/devssd/code/rust/rust-storage-bench"

# Attach to the tmux session
tmux attach -t $SESSION_NAME
