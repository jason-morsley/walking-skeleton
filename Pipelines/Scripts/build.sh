#!/bin/bash

PARENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")";pwd -P)
echo "PARENT_PATH:" ${PARENT_PATH}
source ${PARENT_PATH}/header.sh

WD=$(pwd)
echo "WD:" ${WD}

cd code

###############################################################################

header 'DOTNET VERSION'

dotnet --version

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

cd Source/Presentation/JasonMorsley.Dev.Walking.Skeleton.API

dotnet publish --configuration Release \
               --nologo \
               --no-build \
               --no-restore \
               --output ${WD}/code/Published \
               --verbosity normal

header 'PUBLISH COMPLETED'

###############################################################################

header 'DELETING SOURCE'

rm --recursive --force ${WD}/code/Source

header 'SOURCE DELETED'

###############################################################################