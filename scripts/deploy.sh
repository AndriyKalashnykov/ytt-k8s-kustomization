#!/bin/bash

LAUNCH_DIR=$(pwd); SCRIPT_DIR=$(dirname $0); cd $SCRIPT_DIR; SCRIPT_DIR=$(pwd); cd ..; SCRIPT_PARENT_DIR=$(pwd)
. $SCRIPT_DIR/set-env.sh

cd $SCRIPT_PARENT_DIR

kubectl create ns ${ENV}-spring-petclinic

kapp deploy -a $APP_NAME -f <(ytt -f config/config.yaml -f env/values-${ENV}.yaml -f base/) --diff-changes --yes

kapp inspect -a $APP_NAME  --tree

kubectl get cm,secret,deploy,pod,svc,ingress -n ${ENV}-spring-petclinic

cd $LAUNCH_DIR