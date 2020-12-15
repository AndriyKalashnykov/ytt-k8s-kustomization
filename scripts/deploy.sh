#!/bin/bash

# set -x

LAUNCH_DIR=$(pwd); SCRIPT_DIR=$(dirname $0); cd $SCRIPT_DIR; SCRIPT_DIR=$(pwd); cd ..; SCRIPT_PARENT_DIR=$(pwd)
# echo LAUNCH_DIR=$LAUNCH_DIR; echo SCRIPT_DIR=$SCRIPT_DIR; echo SCRIPT_PARENT_DIR=$SCRIPT_PARENT_DIR
. $SCRIPT_DIR/set-env.sh

cd $SCRIPT_PARENT_DIR

# ytt -f config/config.yaml -f env/values-${ENV}.yaml -f base/

kubectl create ns ${ENV}-spring-petclinic

kapp deploy -a $APP_NAME -f <(ytt -f config/config.yaml -f env/values-${ENV}.yaml -f base/) --diff-changes --yes

kapp inspect -a $APP_NAME  --tree

kubectl get cm,secret,deploy,pod,svc,ingress -n ${ENV}-spring-petclinic

cd $LAUNCH_DIR