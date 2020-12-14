#!/bin/bash

# set -x

LAUNCH_DIR=$(pwd); SCRIPT_DIR=$(dirname $0); cd $SCRIPT_DIR; SCRIPT_DIR=$(pwd); cd ..; SCRIPT_PARENT_DIR=$(pwd)
# echo LAUNCH_DIR=$LAUNCH_DIR; echo SCRIPT_DIR=$SCRIPT_DIR; echo SCRIPT_PARENT_DIR=$SCRIPT_PARENT_DIR
. $SCRIPT_DIR/set-env.sh

cd $SCRIPT_PARENT_DIR

ytt -f config/config.yaml -f env/values-dev.yaml -f base/

# kapp deploy -a petclinic -f <(ytt -f config/config.yaml -f env/values-dev.yaml -f base/) --diff-changes --yes
# kapp inspect -a petclinic --tree
# kapp delete -a petclinic --yes

cd $LAUNCH_DIR