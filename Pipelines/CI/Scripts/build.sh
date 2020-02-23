#!/bin/bash

#set -x

PARENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")";pwd -P)
ROOT="$PARENT_PATH"/../../..
SCRIPTS="$ROOT"/Pipelines/Scripts
source $SCRIPTS/header.sh

cd code

###############################################################################

header 'CLEAN STARTED'

dotnet clean --nologo \
             --verbosity normal

header 'CLEAN COMPLETED'

###############################################################################

header 'RESTORE STARTED'

dotnet restore --verbosity normal

header 'RESTORE COMPLETED'

###############################################################################

header 'BUILD STARTED'

dotnet build --configuration Release \
             --no-restore \
             --verbosity normal

header 'BUILD COMPLETED'

###############################################################################

header 'PUBLISH STARTED'

cd Source/Presentation/Morsley.UK.Walking.Skeleton.API

dotnet publish --configuration Release \
               --nologo \
               --no-build \
               --no-restore \
               --output $ROOT/Published \
               --verbosity normal

header 'PUBLISH COMPLETED'

cd ../../..

rm --recursive Source