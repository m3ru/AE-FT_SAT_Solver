#!/bin/bash
# Build the solver variant
# Usage: ./build.sh <variant_id> <optional-patch-file>
VARIANT_ID=$1
PATCH_FILE=$2

echo "Building variant $VARIANT_ID"
cd solver_base/kissat
if [ -n "$PATCH_FILE" ]; then
    # apply patch
    git apply ../../variants/patches/$PATCH_FILE
fi
./configure
make -j4
cp ./build/kissat ../../../variants/kissat_$VARIANT_ID
cd ../../..
echo "Done"
