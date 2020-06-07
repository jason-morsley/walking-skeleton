#!/bin/bash

PARENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")";pwd -P)
echo "PARENT_PATH:" ${PARENT_PATH}
source ${PARENT_PATH}/header.sh

WD=$(pwd)
echo "WD:" ${WD}

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
                                --ResultsDirectory:${WD}/built/TestsResults/Unit

        sub-header 'TESTS FINISHED'

    fi
    
    cd ..

done

header 'UNIT TESTS COMPLETED'

###############################################################################

header 'DELETING UNIT TESTS'

cd ..

rm --recursive --force Unit

header 'UNIT TESTS DELETED'

###############################################################################