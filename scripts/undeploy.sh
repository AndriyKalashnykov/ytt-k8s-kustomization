#!/bin/bash

LAUNCH_DIR=$(pwd); SCRIPT_DIR=$(dirname $0); cd $SCRIPT_DIR; SCRIPT_DIR=$(pwd); cd ..; SCRIPT_PARENT_DIR=$(pwd)

. $SCRIPT_DIR/set-env.sh

cd $SCRIPT_PARENT_DIR

kapp delete -a $APP_NAME --yes

cd $LAUNCH_DIR