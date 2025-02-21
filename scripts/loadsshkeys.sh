#!/bin/bash
# run this script using dot sourcing
# Example1: . ./loadsshkeys.sh
# Example2: source ./loadsshkeys.sh
PRIVATE_SSHKEY=/path/to/private-ssh-key

pkill ssh-agent
eval "$(ssh-agent -s)"
ssh-add $PRIVATE_SSHKEY
