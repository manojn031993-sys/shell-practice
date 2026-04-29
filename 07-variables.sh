#!/bin/bash

### Special Variables ###
echo "All args passed to script: $@"
echo "Number of vars passed to script: $#
echo "script name: $0"
echo "Present Directory: $PWD"
echo "Who is running: $USER"
echo "Home directory of current user: $Home"
echo "PID of the script: $$"
sleep 100 &
echo "PID of recently executed background process: $!"
echo "All args passed to script: $*"