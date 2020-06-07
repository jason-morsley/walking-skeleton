#!/bin/bash

set -x

#ls -la

#PARENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")";pwd -P)
#ROOT="$PARENT_PATH"/../..
#CI="$ROOT"/Pipelines/CI
#SCRIPTS="$ROOT"/Pipelines/Scripts
#source $SCRIPTS/header.sh

#ls -la

cd tested/Pipelines/CI

###############################################################################

#header 'CREATE DOCKER IMAGE'

docker build --tag morsley-uk-walking-skeleton-api .

#header 'CREATE DOCKER IMAGE'

###############################################################################

#header 'UPLOAD DOCKER IMAGE'



#header 'UPLOAD DOCKER IMAGE'

###############################################################################