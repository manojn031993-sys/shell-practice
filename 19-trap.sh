#!/bin/bash

set -e #ERR

trap 'echo "There is an error in $LINENO, Commanad: $BASH_COMMAND"' ERR

echo "Hello World"
echo "I am learning shell"
echoo "printing error here"
echo "No error in this"
