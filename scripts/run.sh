#!/bin/bash

# set -x

LAUNCH_DIR=$(pwd); SCRIPT_DIR=$(dirname $0); cd $SCRIPT_DIR; SCRIPT_DIR=$(pwd); cd ..; SCRIPT_PARENT_DIR=$(pwd)

. $SCRIPT_DIR/set-env.sh

cd $SCRIPT_PARENT_DIR

ytt -f config/config.yaml -f env/values-${ENV}.yaml -f base/

cd $LAUNCH_DIR