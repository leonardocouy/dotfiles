#!/bin/bash -e

#################################################
## PANES
#################################################

# use rotate split
bind-key + select-layout main-horizontal
bind-key = select-layout main-vertical

# go to pane
bind-key C-h select-pane -L
bind-key C-j select-pane -D
bind-key C-k select-pane -U
bind-key C-l select-pane -R

# new horizontal pane
bind-key   f split-window -v
bind-key C-f split-window -v -c "#{pane_current_path}"

# new vertical pane
bind-key   g split-window -h
bind-key C-g split-window -h -c "#{pane_current_path}"

# swith to another pane
bind C-o last-pane

#################################################
## WINDOWS
#################################################

# tmux new-window (prefix + c)
bind C-n new-window

# tmux select-window -t :0-9 (prefix + 0-9)
# switch windows alt+number
# bind-key C-1 select-window -t 1
# bind-key C-2 select-window -t 2
# bind-key -n M-3 select-window -t 3
# bind-key -n M-4 select-window -t 4
# bind-key -n M-5 select-window -t 5
# bind-key -n M-6 select-window -t 6
# bind-key -n M-7 select-window -t 7
# bind-key -n M-8 select-window -t 8
# bind-key -n M-9 select-window -t 9
# tmux rename-window (prefix + ,)

# switch windows
bind o last-window

# close window
bind C-q killp

#################################################
## CONFIG
#################################################

# Ctrl space as prefix
set -g prefix C-space
unbind C-space
bind C-space send-prefix
set -g base-index 1

# various
# set -g status-utf8 on
# set -g utf8 on
set-option -g default-terminal "screen-256color"
# set -g status-interval 15
set -g status-justify left

# mouse
set-option -g -q mouse on

# setw -g mode-mouse on
# set -g mouse-select-pane on
# set -g mouse-resize-pane on
# set-option -g mouse-select-window on

# set scrollback history to 10000 (10k)
set -g history-limit 10000

# use : to enter tmux command
bind-key : command-prompt

# clear history
bind-key e clear-history

# set window notifications
setw -g monitor-activity on
set -g visual-activity on

# allow the arrow key to be used immediately after changing windows
set-option -g repeat-time 0

#################################################
## STATUS BAR COLORS
#################################################
# colorize messages in the command line
set-option -g message-bg green
set-option -g message-fg black

## status bar
set -g status-bg black
set -g status-fg green

set -g status-left-length 70
set -g status-left ""

set -g status-right-length 160
set -g status-right ""

set-window-option -g window-status-fg blue
set-window-option -g window-status-bg black
set-window-option -g window-status-attr dim

set-window-option -g window-status-current-fg green
set-window-option -g window-status-current-bg black
set-window-option -g window-status-current-attr bright

set -g status-interval 2
set -g status-right "#S #[fg=green,bg=black]"
set -g status-right-length 60
