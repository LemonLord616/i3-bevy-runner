#!/usr/bin/env bash
# Usage: ./runner.sh [path] [workspace]
#
# For convenience, you may put the script in the system PATH:
# sudo ln -s "YourScriptLocation" /usr/bin/"ScriptName"
# for example:
# sudo ln -s ~/i3-bevy-runner/runner.sh /usr/bin/bevyrun
#
# run_game.sh - Launch a Bevy game in a separate i3 workspace with floating terminal for logs
# Copyright (C) 2025  Marat Mestnikov <ma.mestnikov@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Defaults
WORKSPACE="${1:-3}"
GAME_PATH="${2:-$(pwd)}"

# Switch workspace first
i3-msg "workspace $WORKSPACE"

# Open terminal and run cargo
xfce4-terminal --hold --command="bash -c 'cd \"$GAME_PATH\" && cargo run; exec bash'" &

# Make the terminal floating (wait a bit to let it appear)
sleep 0.2
TERMINAL_ID=$(xdotool search --onlyvisible --classname xfce4-terminal | tail -1)
i3-msg "[id=$TERMINAL_ID] floating enable"

