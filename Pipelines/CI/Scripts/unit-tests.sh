#!/bin/bash

#set -x

PARENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")";pwd -P)
ROOT="$PARENT_PATH"/../../..
SCRIPTS="$ROOT"/Pipelines/Scripts
source $SCRIPTS/header.sh

cd built/Tests/Unit

###############################################################################

header 'UNIT TESTS STARTED'

for d in */; do

    cd "$d"

    test_project=$(find . -type f -name "*.csproj")

    if [[ $test_project ]]; then
    
        sub-header 'TESTS INITIATED'

        filename=$(basename $test_project)    
        filename=${filename%.*}.dll        
        test_dll=$(find *bin/Release* -type f -name $filename)
    
        dotnet vstest $test_dll --logger:trx \
                                --ResultsDirectory:$ROOT/TestsResults/Unit

        sub-header 'TESTS FINISHED'

    fi
    
    cd ..

done

header 'UNIT TESTS COMPLETED'

###############################################################################

cd ..

rm --recursive Unit